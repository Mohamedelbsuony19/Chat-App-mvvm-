import 'package:chat_c5/helper/base_mvvm.dart';
import 'package:chat_c5/helper/database/database_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_navigator.dart';

class logInViewModel extends BaseViewModel<LoginNafigator> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void logIn(String email, String password) async {
    try {
      navigator?.showLoading();
      var res = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      navigator?.hideDialog();
      var userObj = await databaseUtils.readuser(res.user?.uid ?? '');
      if (userObj == null) {
        navigator?.showMessage(
            'Failed to complete register,please try register again');
      } else {
        navigator?.goToHome(userObj);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        navigator?.hideDialog();
        navigator?.showMessage('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        navigator?.hideDialog();
        navigator?.showMessage('Wrong password provided for that user.');
      }
    } catch (e) {
      navigator?.showMessage(e.toString());
    }
  }
}
