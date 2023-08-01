import 'package:chatbot_app/export_all.dart';

class LikeUserController extends GetxController {
  List<dynamic> PostLikeUser = [''];
  bool isLoding = false;

  setLoading(bool val) {
    isLoding = val;
    update();
  }

  addUsersLikes(dynamic data) {
    PostLikeUser = [];
    PostLikeUser.add(data);
    update();
  }

  get getList => PostLikeUser;
}
