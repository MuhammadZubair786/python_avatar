import 'package:flutter/material.dart';
import 'package:chatbot_app/export_all.dart';
import 'package:image_picker/image_picker.dart';

class GlobalController extends GetxController {
  // var selectedUser = USERTYPE.none.obs;

  bool isLoding = false;

  setLoading(bool val) {
    isLoding = val;
    update();
  }

  var postsModelLists = <PostModel>[].obs;
  List<dynamic> postsList = [];
  List<dynamic> morePostList = [];

  addPostData(dynamic data) {
    // postsList = [];
    postsList = data;
    update();
  }

  addMorePostData(dynamic data) {
    // postsList = [];
    postsList.addAll(data);
    update();
  }

  final ImagePicker _picker = ImagePicker();
  List<XFile>? images = [];
  List<String> listImagePath = [];
  var imagesCount = 0.obs;

  void pickMultipleImages(BuildContext context) async {
    images = await _picker.pickMultiImage();
    if (images != null) {
      for (XFile file in images!) {
        listImagePath.add(file.path);
      }
    }

    imagesCount.value = listImagePath.length;

    update();
  }

  removeImageFromFilePath(int index) {
    listImagePath.removeAt(index);
    imagesCount.value = imagesCount.value - 1;
    update();
  }

  inclikePost(index) {
    // if (postsList[index]["likesCount"] == 1) {
    //   postsList[index]["likesCount"]--;
    // } else {
      postsList[index]["likesCount"]++;
    // }
    postsList[index]["like"] = !postsList[index]["like"];
    update();
  }

   decclikePost(index) {
    // if (postsList[index]["likesCount"] == 1) {
      postsList[index]["likesCount"]--;
    // } else {
    //   postsList[index]["likesCount"]++;
    // }
    postsList[index]["like"] = !postsList[index]["like"];
    update();
  }

  List DietData = [];
  getDietData(data) {
    DietData = [];
    if (data.length > 0) {
      print(data);
      DietData.add(data);
      update();
    }
  }

  List RoutineData = [];
  getRoutineData(data) {
    RoutineData = [];
    if (data.length > 0) {
      //print(data);
      RoutineData.add(data);
      update();
    }
  }

  List AllRoutine = [];
  getRoutineHistory(data) {
    AllRoutine = [];
    if (data.length > 0) {
      print(data);
      AllRoutine.add(data);
      update();
    }
  }


   List AllDiet = [];
  getDietHistory(data) {
    AllDiet = [];
    if (data.length > 0) {
      print(data);
      AllDiet.add(data);
      update();
    }
  }

  List RoutineData1 = [];
  getRoutineData1(data) {
    RoutineData1 = [];
    if (data.length > 0) {
      //print(data);
      RoutineData1.add(data);
      update();
    }
  }

  // addPostData(data) {
  //   postsModelLists = data;
  //   update();
  // }

  deleteDiet(index) {
    DietData.removeAt(index);
    update();
  }

  deletRoutine(index) {
    RoutineData.removeAt(index);
    update();
  }

  // updatePostsList(List<PostModel> postLists) {
  //   postsModelLists = postLists;
  //   update();
  // }
}
