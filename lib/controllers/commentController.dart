import 'package:chatbot_app/export_all.dart';

class CommentController extends GetxController {
  List<dynamic> commentsList = [''];
  bool isLoding = false;

  setLoading(bool val) {
    isLoding = val;
    update();
  }

  addCommentData(dynamic data) {
    commentsList = [];
    commentsList.add(data);
    update();
  }

   deleteComment(index) {
    print(index);
    commentsList[0].removeAt(index);
    update();
  }

  get getList => commentsList;
}
