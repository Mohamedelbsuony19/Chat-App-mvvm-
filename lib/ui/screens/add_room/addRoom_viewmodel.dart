import 'package:chat_c5/helper/database/database_utils.dart';
import '../../../helper/base_mvvm.dart';
import 'addroom_navigator.dart';

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator> {
  void createingRoom(
    String roomTitle,
    String roomDes,
    String catId,
  ) async {
    navigator?.showLoading(message: 'Creating Room ...');
    try {
      var res = await databaseUtils.createRoom(roomTitle, roomDes, catId);
      navigator?.createdRoom();
    } catch (ex) {
      navigator?.showMessage('${ex.toString()}');
    }
  }
}
