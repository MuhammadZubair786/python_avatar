import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ChatController extends GetxController {
  // var selectedUser = USERTYPE.none.obs;

  bool isLoding = false;

  setLoading(bool val) {
    isLoding = val;
    update();
  }
}
