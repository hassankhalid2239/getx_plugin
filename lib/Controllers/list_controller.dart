import 'package:get/get.dart';

class ListController extends GetxController {
  RxList selectedUsers = [].obs;

  void addUser(String name, String img) {
    selectedUsers.add({'name': name, 'image': img});
  }

  void deleteUser(int index) {
    selectedUsers.removeAt(index);
  }
}
