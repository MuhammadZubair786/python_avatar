import 'package:get/get_state_manager/get_state_manager.dart';

class BottomController extends GetxController {
  var navigationBarIndexValue = 0;

  void navBarChange(value) {
    navigationBarIndexValue = value;
    update();
  }
}
