import 'package:chat_c5/helper/base_mvvm.dart';
import 'package:chat_c5/helper/database/database_utils.dart';
import 'package:chat_c5/ui/screens/register/register_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../models/my_user.dart';

class RegisterViewModel extends BaseViewModel<RegisterNavigator> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void Register(String email, String password, String fristName,
      String lastName, String userName) async {
    try {
      navigator?.showLoading();
      var res = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = MyUser(
          id: res.user?.uid ?? '',
          fName: fristName,
          lName: lastName,
          userName: userName,
          email: email);
      var task = await databaseUtils.createDatabase(user);
      navigator?.goHome(user);
      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        navigator?.hideDialog();
        navigator?.showMessage('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        navigator?.hideDialog();
        navigator?.showMessage('The account already exists for that email.');
      }
    } catch (e) {
      navigator?.showMessage(e.toString());
    }
  }
}
