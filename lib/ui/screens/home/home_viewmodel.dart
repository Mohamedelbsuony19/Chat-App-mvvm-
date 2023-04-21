import 'package:chat_c5/helper/base_mvvm.dart';
import 'package:chat_c5/helper/database/database_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../models/room.dart';
import 'home_navigator.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  List<Room> rooms = [];
  late Stream<QuerySnapshot<Room>> roomStream;

  void getRooms() async {
    rooms = await databaseUtils.getRoomsFromFireStore();
    notifyListeners();
  }

  void listenRoomUpdate() {
    roomStream = databaseUtils.ListenStreamForRoom();
    notifyListeners();
  }
}
