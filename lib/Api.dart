import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:chatbot_app/controllers/LikeController.dart';
import 'package:chatbot_app/controllers/commentController.dart';
import 'package:chatbot_app/screens/auth/create_profile_screen.dart';
import 'package:chatbot_app/screens/auth/login_screen.dart';
import 'package:chatbot_app/screens/auth/otp_screen.dart';
import 'package:chatbot_app/screens/auth/reset_password_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers/bottom_controller.dart';
import 'export_all.dart';
import 'screens/main_folder/custom_bottom_navigation.dart';

String apiGlobal = "https://gymsta-api.jumppace.com:9000/api/v1/";

var check = '';

class ApiService {
  final bottomctrl = Get.put(BottomController());
  Future getMealsApi(context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });
    final uri = Uri.parse('${apiGlobal}meal');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };

    http.Response response = await http.get(
      uri,
      headers: headers,
    );
    var res_data = json.decode(response.body.toString());
    if (res_data['status']) {
      Get.back();

      return res_data;
    }
    if (!res_data['status']) {
      Get.back();

      Get.snackbar(
        'Error',
        res_data['message'],
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.white,
        colorText: Colors.black,
      );
    }
    return null;
  }

  callRegister(context, data) async {
    //print(data);
    // final usercontroller = Get.put(UserController());

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}auth/signup');
    //print(uri);
    final headers = {'Content-Type': 'application/json'};
    String jsonBody = json.encode(data);

    resisteremail = data["email"];

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );

    var res_data = json.decode(response.body.toString());
    // Map<String, dynamic> userMap = jsonDecode(response.body.toString());
    // var user = UserModel.fromJson(userMap);
    // ////print(user.userEmail);

    // old code
    if (res_data['status']) {
      username = res_data['data']['fullName'];
      userId = res_data['data']['_id'];
      follower = res_data['data']['follower'].toString();
      following = res_data['data']['following'].toString();
      userType = res_data['data']['userType'];
      newToken = res_data['data']['token'];
      Get.back();
      Get.snackbar('Success', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
      // bottomctrl.navBarChange(0);
      // Get.to(() => CustomBottomNavigation());

      if (res_data['data']['isCompleteProfile']) {
        bottomctrl.navBarChange(0);

        Get.to(() => CustomBottomNavigation());
      } else {
        userType = res_data['data']['userType'].toString().toLowerCase();

        userType = res_data['data']['userType'].toString();

        final int signUpType = userType == 'Customer' ? 0 : 1;

        // //print(data["email"]);

        Get.to(
            () => OtpScreen(
                  userType: signUpType,
                ),
            arguments: ["VerifyUser", data["email"], data]);

        // Get.to(() => CreateProfileScreen(
        //       userType: signUpType,
        //     ));
      }

      // if (res_data['data']['token']) {
      // } else {
      //   Get.to(() => CreateProfileScreen());
      // }
    }
    if (!res_data['status']) {
      Get.back();

      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
  }

  resendotp(context, email) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}auth/resend');
    final headers = {'Content-Type': 'application/json'};
    String jsonBody = json.encode({"email": email});

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );

    var res_data = json.decode(response.body.toString());

    print(res_data);

    if (res_data['status']) {
      Get.back();
      Get.snackbar('Success', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
    if (!res_data['status']) {
      Get.back();

      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
  }

  callLogin(context, data) async {
    // final UserModel? userModel;
    //print(data);
    final globalController = Get.put(GlobalController());

    globalController.setLoading(true);

    final uri = Uri.parse('${apiGlobal}auth/login');

    final headers = {'Content-Type': 'application/json'};
    String jsonBody = json.encode(data);

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );

    var res_data = json.decode(response.body.toString());
    if (res_data['status']) {
      globalController.setLoading(false);

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      if (userType == res_data['data']['userType']) {
        username = res_data['data']['fullName'];
        userId = res_data['data']['_id'];
        follower = res_data['data']['follower'].toString();
        following = res_data['data']['following'].toString();
        newToken = res_data['data']['token'];
        posts = res_data['data']['post'];
        userType = res_data['data']['userType'];
        notification = res_data["data"]["notificationOn"];

        //  await prefs.setStringList('following', res_data['data']['post']);

        //  var post1 =  prefs.setStringList('following', res_data['data']['post']);res_data['data']['post'];

        //print(res_data['data']['post'].runtimeType);

        await prefs.setBool("User_login", true);

        await prefs.setString('username', res_data['data']['fullName']);
        await prefs.setString('userId', res_data['data']['_id']);
        await prefs.setInt('follower', res_data['data']['follower']);
        await prefs.setInt('following', res_data['data']['following']);
        await prefs.setString('newToken', res_data['data']['token']);
        await prefs.setString('userType', res_data['data']['userType']);

        // await prefs.setStringList('posts', res_data['data']['fullName']);

        // await prefs.setString('username', res_data['data']['fullName']);

        //  Get.replace(() => CustomBottomNavigation());
        bottomctrl.navBarChange(0);
        Get.offAll(() => CustomBottomNavigation());
        // Navigator.pushReplacement(context, newRoute)
      } else {
        Get.snackbar(
            'you can not login as ${res_data['data']['userType']}', '');
      }
    }
    if (!res_data['status']) {
      globalController.setLoading(false);
      Get.replace(() => LoginScreen());

      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
  }

  CreateRoutine(data, context) async {
    final uri = Uri.parse('${apiGlobal}user/addroutine');

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });
        

    var headers = {
      'authorization': newToken.toString(),
      "content-type": "application/json"
    };

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: json.encode(data),
    );
    var res_data = json.decode(response.body.toString());
    //print(res_data);

    if (res_data["status"]) {
      Get.back();

      Get.snackbar('Routine Created', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          colorText: Colors.black);
      Get.to(() => CustomBottomNavigation());
    } else {
      Get.back();

      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          colorText: Colors.black);
    }
  }

  SendRequest(Data, context) async {
    String jsonBody = json.encode(Data);
    //print(jsonBody);

    final uri = Uri.parse('${apiGlobal}request/sendRequest');
    //print(uri);

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    var headers = {
      'authorization': newToken.toString(),
      'Content-Type': 'application/json'
    };

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );
    var res_data = json.decode(response.body.toString());
    //print(res_data);
    if (res_data["status"]) {
  Get.back();

      Get.snackbar('Send Request', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          colorText: Colors.black);

      return true;
    } else {
      Get.back();

      Get.snackbar('Send Request', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          colorText: Colors.black);
      return false;
    }
    // //print(Data);
  }

  DeleteRequest(Data, context) async {
    String jsonBody = json.encode(Data);
    //print(jsonBody);

    final uri = Uri.parse('${apiGlobal}request/sendRequest');
    //print(uri);

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    var headers = {
      'authorization': newToken.toString(),
      'Content-Type': 'application/json'
    };

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );
    var res_data = json.decode(response.body.toString());
    //print(res_data);
    if (res_data["status"]) {
      Get.back();

      Get.snackbar('Send Request', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          colorText: Colors.black);

      return true;
    } else {
      Get.back();

      Get.snackbar('Send Request', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          colorText: Colors.black);
      return false;
    }
    // //print(Data);
  }

  RequestUpdate(String resp, String Requestid, BuildContext context) async {
    if (resp == "Accept") {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return spinkit;
          });

      // //print("Request Update");
      // //print(Requestid);

      Map data = {"requestId": Requestid};
      String jsonBody = json.encode(data);
      //print(jsonBody);

      final uri = Uri.parse('${apiGlobal}request/acceptRequest');
      //print(uri);
      var headers = {
        'authorization': newToken.toString(),
        'Content-Type': 'application/json'
      };

      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
      );
      var res_data = json.decode(response.body.toString());

      if (res_data['status']) {
        //print("Request Accept");

        Get.snackbar('Accept Request', res_data['message'],
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            colorText: Colors.black);

        Get.back();
        return "Request Accept";
        // getFollowerRequest();
      } else {
        Get.back();

        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            colorText: Colors.black);

        return res_data['message'];
      }
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return spinkit;
          });

      Map data = {"requestId": Requestid};
      String jsonBody = json.encode(data);
      //print(jsonBody);

      final uri = Uri.parse('${apiGlobal}request/rejectRequest');
      //print(uri);
      // final headers = {'Content-Type': 'application/json'};
      var headers = {
        'authorization': newToken.toString(),
        'Content-Type': 'application/json'
      };

      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
      );
      var res_data = json.decode(response.body.toString());

      if (res_data['status']) {
        //print("Request Reject");
        Get.back();
        return "Request Reject";
        // getFollowerRequest();
      } else {
        Get.snackbar('Error', res_data['message'],
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            colorText: Colors.black);

        return res_data['message'];
      }
    }
  }

  makePostRequest(context, data) async {
    final uri = Uri.parse('${apiGlobal}request/sendRequest');
    final headers = {'authorization': newToken.toString()};

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: data,
    );
    //print(response.body);
    //print(response.statusCode);
    return response;
  }

  getFeedsApi(context, page, limit) async {
    log('GET Feeds CALLED: ');

    final uri = Uri.parse('${apiGlobal}post/getFeeds?page=$page&limit=$limit');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };

    http.Response response = await http.get(
      uri,
      headers: headers,
    );

    var res_data = json.decode(response.body.toString());

    if (res_data['status']) {
      // log("Feeds response : $data");
      // Get.back();
      return res_data['data'];
    } else if (!res_data['status']) {
      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
    // Get.back();
    return res_data['data'];
  }

  getPostById(context, posstId) async {
    log('GET getPostById CALLED: ');
    final dt = Get.put(CommentController());
    dt.setLoading(true);

    final uri = Uri.parse('${apiGlobal}post/getPostByPostId/${posstId}');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };

    http.Response response = await http.get(
      uri,
      headers: headers,
    );

    var res_data = json.decode(response.body.toString());

    if (res_data['status']) {
      dt.setLoading(false);

      return res_data['data'];
    } else if (!res_data['status']) {
      dt.setLoading(false);

      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
    dt.setLoading(false);

    return res_data['data'];
  }

  likePost(context, String postId) async {
    log('LIKE POST CALLED: ');
    final uri = Uri.parse('${apiGlobal}post/likePost');

    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };
    http.Response response = await http.post(
      uri,
      body: jsonEncode(<String, String>{
        'postid': postId,
      }),
      headers: headers,
    );
    var res_data = json.decode(response.body.toString());
    if (res_data['status']) {
      // log("LIKE Response: $data");
      return res_data['data'];
    } else if (!res_data['status']) {
      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
    return res_data['data'];
  }

  Future deleteCommentApi(context, CommentId, index) async {
    final commentController = Get.put(CommentController());
    commentController.setLoading(true);
    final uri = Uri.parse('${apiGlobal}post/delComment/$CommentId');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };

    http.Response response = await http.delete(
      uri,
      headers: headers,
    );
    var res_data = json.decode(response.body.toString());
    if (res_data['status']) {
      commentController.setLoading(false);
      commentController.deleteComment(index);
      Get.snackbar(res_data['message'], '');
      bottomctrl.navBarChange(4);
      Get.to(CustomBottomNavigation())!.then((value) {});
    } else {
      commentController.setLoading(false);
      Get.snackbar(res_data['message'], "");
    }
  }

  likePostUsers(context, String postId) async {
    log('LIKE POST Api Users get: ');

    final dt = Get.put(LikeUserController());
    dt.setLoading(true);

    final uri = Uri.parse('${apiGlobal}post/getlikes/${postId}');
    print(uri);
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };
    http.Response response = await http.get(
      uri,
      headers: headers,
    );
    var res_data = json.decode(response.body.toString());
    if (res_data['status']) {
      // log("LIKE Response: $data");
      dt.setLoading(false);
      return res_data['data'];
    } else if (!res_data['status']) {
      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
    dt.setLoading(false);
    return res_data['data'];
  }

  commentPost(context, String postId, String messaeg) async {
    final dt = Get.put(CommentController());

    log('COMMENT POST CALLED');
    final uri = Uri.parse('${apiGlobal}post/commentPost');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };
    dt.setLoading(true);

    http.Response response = await http.post(
      uri,
      body: jsonEncode(<String, String>{
        'postid': postId,
        'text': messaeg,
      }),
      headers: headers,
    );
    var res_data = json.decode(response.body.toString());
    if (res_data['status']) {
      final data = res_data['data'];
      log("Comment Response: $data");
      dt.setLoading(false);

      return res_data['data'];
    } else if (!res_data['status']) {
      dt.setLoading(false);

      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
    dt.setLoading(false);

    return res_data['data'];
  }

  Future<List<PostModel>> getPostsApi(context) async {
    log('GET POST API CALLED: ');
    final List<PostModel> postModelList = [];
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //       return spinkit;
    //     });

    final uri = Uri.parse('${apiGlobal}post/getFeeds');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };

    http.Response response = await http.get(
      uri,
      headers: headers,
    );

    var res_data = json.decode(response.body.toString());
    log('');
    if (res_data['status']) {
      List<dynamic> data = res_data['data'];
      log("DATA: $data");
      if (data.length != 0) {
        data.forEach((element) {
          postModelList.add(PostModel.fromJson(element));
        });
        log("GET POSTS API: $postModelList ${postModelList.length} ");
        Get.back();
        return postModelList;
      }
    }
    if (!res_data['status']) {
      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
    Get.back();
    return [];
  }

// List Followers = [];
  getFollowers() async {
    final Url = Uri.parse('${apiGlobal}follow/getFollowers');
    final headers = {'authorization': newToken.toString()};
    http.Response response = await http.get(
      Url,
      headers: headers,
    );
    var res_data = json.decode(response.body);
    // Followers = res_data;
    //print("List of ${res_data}");
    return res_data;
  }

  getFollowing() async {
    final Url = Uri.parse("${apiGlobal}follow/getFollowing");
    final headers = {"authorization": newToken.toString()};

    http.Response response = await http.get(
      Url,
      headers: headers,
    );
    var res_data = json.decode(response.body);
    //print("List of ${res_data}");
    return res_data;
  }

  RemoveFollower(followingId, context) async {
    //print(followingId);

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    var body = {"followerId": followingId};

    // String jsonBody = json.encode(body);

    // //print(body);
    //   //print(jsonBody);

    final Url = Uri.parse("${apiGlobal}follow/follower");
    final headers = {'authorization': newToken.toString()};

    //print(Url);
    //print(headers);
    // //print(jsonBody);

    http.Response response = await http.post(Url, headers: headers, body: body);
    //print(response.body);

    var res_data = json.decode(response.body);
    //print(res_data["message"]);

    if (res_data["status"]) {
      Get.back();
      Get.snackbar('SuccessFully', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);

      return true;
    } else {
      Get.back();
      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
  }

  getProfileDetails(uid, type) async {
    final Url = Uri.parse(
        "https://gymsta-api.jumppace.com:9000/api/v1/auth/getUserById?id=$uid&userType=$type");
    final headers = {'authorization': newToken.toString()};

    http.Response response = await http.get(
      Url,
      headers: headers,
    );

    var res_data = json.decode(response.body);

    return res_data;
  }

  Future<UserModel?> getProfileApi(context) async {
    final UserModel? userModel;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}auth/profile');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };

    http.Response response = await http.get(
      uri,
      headers: headers,
    );

    var res_data = json.decode(response.body.toString());
    // Map<String, dynamic> userMap = jsonDecode(response.body.toString());
    // var user = UserModel.fromJson(userMap);
    // ////print(user.userEmail);

    if (res_data['status']) {
      Get.back();
      userType = res_data['data']['userType'];
      newToken = res_data['data']['token'];
      userModel = UserModel.fromJson(res_data['data']);

      // userModel = UserModel(
      //   id: res_data['data']["_id"],
      //   fullName: res_data['data']["fullName"],
      //   follower: res_data['data']["follower"],
      //   following: res_data['data']["following"],
      //   routine: res_data['data']["routine"],
      //   nutrition: res_data['data']["nutrition"],
      //   dietplane: res_data['data']["dietplane"],
      //   userType: res_data['data']["userType"],
      //   image: res_data['data']["image"],
      //   isCompleteProfile: res_data['data']["isCompleteProfile"],
      //   token: res_data['data']["token"],
      //   post: res_data['data']["post"],
      //   notificationOn: res_data['data']["notificationOn"],
      // );

      return userModel;
    }
    if (!res_data['status']) {
      Get.back();

      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
    return null;
  }

  uploadMedia(ImagesFiles) async {
    var headers = {
      'authorization': newToken.toString(),
      'deviceToken': deviceToken.toString()
    };
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${apiGlobal}auth/uploadmedia'));
      // var response, responsed, responseData;

      request.fields.addAll({'fileType': 'Image', 'fileRole': 'userMedia'});
      for (var i = 0; i < ImagesFiles.length; i++) {
        request.files.add(await http.MultipartFile.fromPath(
            'file', '${ImagesFiles[i]!.path}'));
      }

      request.headers.addAll(headers);
      log('Before Sending Data');

      var response = await request.send();

      var responsed = await http.Response.fromStream(response);
      log('After Sending Data');

      final responseData = json.decode(responsed.body);

      if (response.statusCode == 200) {
        Get.back();
        newToken = responseData['data']['token'];

        Get.to(() => CustomBottomNavigation());
      } else {
        Get.snackbar('Error', responseData['message'],
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            colorText: Colors.black);
      }
    } catch (e) {
      //print(e.toString());
    }
  }

  forgetPasswordCallApi(context, data) async {
    //print(data);
    //print("======");
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}auth/forgetpassword');
    //print(uri);
    final headers = {'deviceToken': deviceToken.toString()};
    // String jsonBody = json.encode(data);

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: data,
    );

    var res_data = json.decode(response.body.toString());
    // Map<String, dynamic> userMap = jsonDecode(response.body.toString());
    // var user = UserModel.fromJson(userMap);
    // ////print(user.userEmail);

    // old code
    if (res_data['status']) {
      Get.back();
      Get.snackbar('Success', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
      newToken = res_data['data']['token'];

      Get.to(
          () => OtpScreen(
                userType: 0,
              ),
           arguments: ["VerifyOtp", data["email"], data]);
    }
    if (!res_data['status']) {
      Get.back();

      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
  }

  verifyUserCallApi(context, data, usertype) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}auth/VerifyUser');
    //print(uri);
    log('OTP BODY: $data');

    http.Response response = await http.post(
      uri,
      body: data,
    );

    var res_data = json.decode(response.body.toString());
    //print(res_data);
    Get.back();

    if (res_data["message"] == "User verified successfully") {
      Get.snackbar('Verify User', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
      Get.to(() => CreateProfileScreen(
            userType: usertype,
          ));
    } else {
      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
  }

  otpVerificationCallApi(context, data) async {
 showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}auth/verifyotp');
    //print(uri);
    final headers = {'authorization': newToken.toString()};
    // String jsonBody = json.encode(data);

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: data,
    );

    var res_data = json.decode(response.body.toString());
    // Map<String, dynamic> userMap = jsonDecode(response.body.toString());
    // var user = UserModel.fromJson(userMap);
    // ////print(user.userEmail);

    // old code
    if (res_data['status']) {
      Get.back();
      Get.snackbar('Success', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
      newToken = res_data['data']['token'];

      Get.to(
          () => ResetPasswordScreen());
    }
    if (!res_data['status']) {
      Get.back();

      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
  }

  resetPasswordApi(context, data) async {
    //print(data);
    // final usercontroller = Get.put(UserController());
    //////print(data);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}auth/resetpassword');
    //print(uri);
    final headers = {
      'authorization': newToken.toString(),
      'deviceToken': deviceToken.toString(),
      'Content-Type': 'application/json'
    };

    String jsonBody = json.encode(data);

    log('URI: $uri Headers: $headers ');
    log('JSONBODY: $data');

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );

    var res_data = json.decode(response.body.toString());
    // Map<String, dynamic> userMap = jsonDecode(response.body.toString());
    // var user = UserModel.fromJson(userMap);
    // ////print(user.userEmail);
    // Get.back();
    try {
      log('resetPasswordApi : $res_data ${res_data['status']}  ${res_data['data']} ${res_data['message']}');
    } catch (e) {
      log('excpetion Here: $e $res_data ${res_data['status']} ${res_data['data']} ${res_data['message']}');
    }

    if (res_data['status']) {
      Get.back();

      Get.snackbar('Success', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);

      Get.toNamed("/LoginScreen");
      ;
    }

    if (!res_data['status']) {
      Get.back();

      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
  }

  updatePassword(context, data) async {
    //print(data);
    // final usercontroller = Get.put(UserController());
    //////print(data);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}auth/changePassword');
    //print(uri);
    final headers = {
      'authorization': newToken.toString(),
      'Content-Type': 'application/json'
    };

    String jsonBody = json.encode(data);

    log('URI: $uri Headers: $headers ');
    log('JSONBODY: $data');

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );

    var res_data = json.decode(response.body.toString());
    // Map<String, dynamic> userMap = jsonDecode(response.body.toString());
    // var user = UserModel.fromJson(userMap);
    // ////print(user.userEmail);
    // Get.back();
    try {
      log('update password : $res_data ${res_data['status']}  ${res_data['data']} ${res_data['message']}');
    } catch (e) {
      log('excpetion Here: $e $res_data ${res_data['status']} ${res_data['data']} ${res_data['message']}');
    }

    if (res_data['status']) {
      Get.back();

      Get.snackbar('Success', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);

      ;
    }

    if (!res_data['status']) {
      Get.back();

      Get.snackbar('Error', res_data['message'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black);
    }
  }

  updateProfile(context, data, imageFiles, dynamic certificateFile) async {
    final gC = Get.put(GlobalController());
    gC.setLoading(true);

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    //print(newToken.toString());

    var headers = {
      'authorization': newToken.toString(),
      'deviceToken': deviceToken.toString()
    };
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${apiGlobal}auth/updateprofile'));
      request.fields.addAll(data);
      if (userType == 'Customer') {
        if (imageFiles != null) {
          request.files
              .add(await http.MultipartFile.fromPath('image', '${imageFiles}'));
        }
      } else {
        if (imageFiles != null) {
          request.files
              .add(await http.MultipartFile.fromPath('image', '${imageFiles}'));
        }
        if (certificateFile != null) {
          for (var i = 0; i < certificateFile.length; i++) {
            request.files.add(await http.MultipartFile.fromPath(
                'certificate', certificateFile[i]));
          }
        }

        // request.files.add(await http.MultipartFile.fromPath('certificate', '${certificateFile}'));
      }

      request.headers.addAll(headers);

      var response = await request.send();

      var responsed = await http.Response.fromStream(response);

      final responseData = json.decode(responsed.body);

      if (response.statusCode == 200) {
        Get.back();
        gC.setLoading(false);
        responseData;
        //print(responseData['data']);

        Get.snackbar('Success', responseData['message'],
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            colorText: Colors.black);

        // newToken = responseData['data']['token'];
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("username", data["fullName"]);

        if (check == 'editProfile') {
          bottomctrl.navBarChange(4);
          Get.to(() => CustomBottomNavigation());
        } else if (check == 'completeProfile') {
          bottomctrl.navBarChange(0);
          Get.to(() => CustomBottomNavigation());
        }
        return responseData;
        // uploadMedia(mediaFiles);
      } else {
        Get.snackbar('Error', responseData['message'],
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            colorText: Colors.black);

        gC.setLoading(false);

        Get.snackbar('Error', responseData['message'],
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            colorText: Colors.black);
      }
    } catch (e) {
      //print(e.toString());
    }
  }

  logOutApi(context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });
    try {
      var headers = {
        'authorization': newToken.toString(),
        'devicetoken': deviceToken.toString()
      };
      var request = http.Request('POST', Uri.parse('${apiGlobal}auth/logout'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      //print(response.statusCode);

      if (response.statusCode == 200) {
        Get.back();
        userType = "";
        newToken = "";

        SharedPreferences prefrences = await SharedPreferences.getInstance();
        await prefrences.clear();

        // AuthToken;
        // final userController = Get.put()
        // globalHeaders.clear();

        Get.toNamed('/UserSelectionScreen');
      } else {
        log('Api not work');
      }
    } on Exception catch (e) {
      log('LOGOUT API Exception: $e');
      Get.snackbar(
        'Error',
        'Log out Failed',
        backgroundColor: Colors.white,
      );
    }
  }

  createNewPost(
      BuildContext context, String caption, File file, bool isImage) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });
    var headers = {
      'authorization': newToken.toString(),
      'deviceToken': deviceToken.toString()
    };
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${apiGlobal}post/createPost'));

      request.fields.addAll(
          {'title': '${caption}', 'fileType': isImage ? 'Image' : 'Video'});

      request.files
          .add(await http.MultipartFile.fromPath('file', '${file.path}'));

      request.headers.addAll(headers);

      log('REQUEST : ${request.headers} ${request.files} ${request.fields}');

      var response = await request.send();

      var responsed = await http.Response.fromStream(response);

      final responseData = json.decode(responsed.body);

      log('After Sending Data: $responseData');

      if (response.statusCode == 200 && responseData['status']) {
        Get.snackbar('Success', responseData['message'],
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            colorText: Colors.black);
        final bt = Get.put(BottomController());
        bt.navBarChange(0);
        Get.to(() => CustomBottomNavigation());
      } else {
        Get.snackbar('Error', responseData['message'],
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.white,
            colorText: Colors.black);
      }
    } catch (e) {
      log('CREATE NEW POST Exception caught: $e');
    }
  }

  createDiet(context, data) async {
    //print(data);

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}user/adddiet');

    String jsonBody = json.encode(data);
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );

    var res_data = json.decode(response.body.toString());

    if (res_data['status']) {
      Get.back();
      Get.snackbar(res_data['message'], "");

      // Get.to(() => LastExampleScreen());
      final dt = Get.put(BottomController());
      dt.navBarChange(0);
      Get.to(() => CustomBottomNavigation());

      // //print(res_data['data']);

      // return dt.getDietData(res_data['data']);
    } else {
      Get.back();
      Get.snackbar(res_data['message'], "");
    }
  }

  Future getDietsApi(context) async {
    final dt = Get.put(GlobalController());
    dt.setLoading(true);
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };
    final uri = Uri.parse('${apiGlobal}user/getdiet');
    http.Response response = await http.get(
      uri,
      headers: headers,
    );
    var res_data = json.decode(response.body.toString());
    if (res_data['status']) {
      dt.setLoading(false);
      if (res_data['data'] != null) {
        var main_deit_data = [];
        print("leng" + res_data['data'].length.toString());
        for (var i = 0; i < res_data['data'].length; i++) {
          print(res_data['data'][i]["isDeleted"]);
          if (res_data['data'][i]["isDeleted"] == false) {
            main_deit_data.add(res_data['data'][i]);
          }
          print("checkere app");
          print(main_deit_data);
        }
        print("data 1234");
        print(main_deit_data);
        return dt.getDietData(main_deit_data);
      } else {
        Get.snackbar("you have no diet plan", "");
      }
    } else {
      dt.setLoading(false);
      Get.snackbar(res_data['message'], "");
    }
  }

  Future getRoutineApi(context) async {
    final dt = Get.put(GlobalController());
    dt.setLoading(true);
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };
    final uri = Uri.parse('${apiGlobal}user/getroutine');
    http.Response response = await http.get(
      uri,
      headers: headers,
    );
    var res_data = json.decode(response.body.toString());
    //print(res_data);

    if (res_data['status']) {
      dt.setLoading(false);
      //print(res_data['data']);
      if (res_data['data'] != null ||
          res_data["message"] != "no Routine plan created") {
        if (res_data['data'][0] != null) {
          //print("test");
          //print(res_data['data'].length);
          var main_routine_data = [];
          for (var i = 0; i < res_data['data'].length; i++) {
            print(res_data['data'][i]["isDeleted"]);
            if (res_data['data'][i]["isDeleted"] == false) {
              main_routine_data.add(res_data['data'][i]);
            }
            // //print(res_data['data'][i]["isDeleted"]);
          }

          return dt.getRoutineData(main_routine_data);
        }
      } else {
        dt.setLoading(false);
        Get.snackbar("you have no Routine plan", "");
      }
    } else {
      dt.setLoading(false);
      Get.snackbar(res_data['message'], "");
    }
  }

  Future getAllRoutineHistory(context) async {
    final dt = Get.put(GlobalController());
    dt.setLoading(true);
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };
    final uri = Uri.parse('${apiGlobal}user/getroutine');
    http.Response response = await http.get(
      uri,
      headers: headers,
    );
    var res_data = json.decode(response.body.toString());
    if (res_data['status']) {
      dt.setLoading(false);
      if (res_data['data'] != null ||
          res_data["message"] != "no Routine plan created") {
        if (res_data['data'][0] != null) {
          print(res_data["data"].length);

          return dt.getRoutineHistory(res_data["data"]);
        }
      } else {
        // dt.setLoading(false);
        Get.snackbar("you have no Routine plan", "");
      }
    } else {
      // dt.setLoading(false);
      Get.snackbar(res_data['message'], "");
    }
  }

  Future getAllDietHistory(context) async {
    final dt = Get.put(GlobalController());
    dt.setLoading(true);
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };
    final uri = Uri.parse('${apiGlobal}user/getdiet');
    http.Response response = await http.get(
      uri,
      headers: headers,
    );
    var res_data = json.decode(response.body.toString());
    if (res_data['status']) {
      dt.setLoading(false);
      if (res_data['data'] != null) {
        if (res_data['data'][0] != null) {
          print(res_data["data"].length);

          return dt.getDietHistory(res_data["data"]);
        }
      } else {
        // dt.setLoading(false);
        Get.snackbar("you have no Routine plan", "");
      }
    } else {
      // dt.setLoading(false);
      Get.snackbar(res_data['message'], "");
    }
  }


  // create Conservation 

    createConservation(data) async {
    String jsonBody = json.encode(data);
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };
    final uri = Uri.parse('${apiGlobal}chat/conversation');
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody
    );
     var res_data = json.decode(response.body.toString());
     print(res_data);

      if (res_data['status']) {
        if(res_data['message']!="Conversation already Created"){
           Get.snackbar(res_data['message'], "");
          return res_data;

        }
        return res_data;

     }
     else{
       Get.snackbar(res_data['message'], "");
     }

    
  }


//chatlistApi

   Future getChatListApi(context) async {

    
  
     final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };
    final uri = Uri.parse('${apiGlobal}chat/conversation');


    http.Response response = await http.get(
      uri,
      headers: headers,
    );
    var res_data = json.decode(response.body.toString());
   
     if (res_data['status']) {
      return res_data;
     }
     else{
       Get.snackbar(res_data['message'], "");
     }



   }



  Future getRoutineApi1(context) async {
    final dt = Get.put(GlobalController());
    dt.setLoading(true);
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };
    final uri = Uri.parse('${apiGlobal}user/getroutine');
    http.Response response = await http.get(
      uri,
      headers: headers,
    );
    var res_data = json.decode(response.body.toString());
    //print(res_data);

    if (res_data['status']) {
      dt.setLoading(false);
      //print(res_data['data']);
      if (res_data['data'] != null ||
          res_data["message"] != "no Routine plan created") {
        if (res_data['data'][0] != null) {
          //print("test");
          //print(res_data['data'].length);
          var main_routine_data = [];
          for (var i = 0; i < res_data['data'].length; i++) {
            if (res_data['data'][i]["isDeleted"] == false) {
              RoutineId = res_data['data'][i]['_id'];
              final currentDate = DateTime.now();

              if (int.parse(
                      res_data['data'][i]["endDate"].toString().substring(8)) <
                  int.parse(currentDate.day.toString())) {
                //print(int.parse(
                // res_data['data'][i]["endDate"].toString().substring(8)));
                main_routine_data.add(res_data['data'][i]);
              }
            }
            // //print(res_data['data'][i]["isDeleted"]);
          }

          return dt.getRoutineData1(main_routine_data);
        }
      } else {
        dt.setLoading(false);
        Get.snackbar("you have no Routine plan", "");
      }
    } else {
      dt.setLoading(false);
      Get.snackbar(res_data['message'], "");
    }
  }

  Future getExercises(context) async {
    // //print(context);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });

    final uri = Uri.parse('${apiGlobal}exercise');
    http.Response response = await http.get(
      uri,
    );
    var res_data = json.decode(response.body.toString());
    // //print(res_data[""]);
    Get.back();
    return res_data;
  }

  EditmyProfile(sendData) async {
    // log("place order jsonbody" + jsonBody.toString());
    var getId = sendData['quote_id'];
    log("place order get quote id ${getId}");

    final uri = Uri.parse('${apiGlobal}auth/updateprofile');
    var request = http.MultipartRequest('POST', uri);

    // var headers = {'Authorization': "bearer " + globaltoken};

    if (sendData['signature'] != null) {
      var imagepath = sendData['signature'];
      imagepath.split("File: '");

      ////print(sendData['signature'].value);
      // var multipartImage = await http.MultipartFile.fromPath(
      //     'signature_1', sendData['signature'],
      //     filename: signaturetype,
      //     contentType: MediaType(attachmentType, currentFileType));
      // request.files.add(multipartImage);
    }

    userType == "Customer"
        ? request.fields.addAll({
            'fullName': sendData['fullname'],
            'age': sendData['age'],
            'song': sendData['song'],
            'bio': sendData['bio']
          })
        : request.fields.addAll({
            'fullName': sendData['fullname'],
            'age': sendData['age'],
            'experience': sendData['experience'],
            'bio': sendData['bio'],
            'skills': sendData['skills'],
            'workingAt': sendData['workingAt']
          });

    if (sendData['imageFile'] != null) {
      //print(sendData['imageFile'].toString());
      //print(sendData['imageFile'].path.toString());
      var multipartFile = await http.MultipartFile.fromPath(
        'image', sendData['imageFile']!.path,
        filename: sendData['imageFile'].path.split('/').last,

        // contentType: MediaType("image", "jpg")
      );

      request.files.add(multipartFile);
    }
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };

    String jsonBody = json.encode(request.fields);
    log("Request " + jsonBody.toString());
    request.headers.addAll(headers);
    log("request" + request.toString());
    var response = await request.send();
    final res = await http.Response.fromStream(response);
    log("res //print" + res.body.toString());
    var res_data = json.decode(res.body.toString());

    return res_data;
  }

 

  getRequest() async {
    // final headers = {
    //   'Content-Type': 'application/json',
    //   'authorization': newToken.toString()
    // };
    // final uri = Uri.parse('${apiGlobal}request/getRequestsList');
    // http.Response response = await http.get(
    //   uri,
    //   headers: headers,
    // );

    //print(res_data);
  }

  Future deleteDietsApi(context, dId) async {
    final globalController = Get.put(GlobalController());
    globalController.setLoading(true);
    final uri = Uri.parse('${apiGlobal}user/deletediet/$dId');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };

    http.Response response = await http.delete(
      uri,
      headers: headers,
    );
    var res_data = json.decode(response.body.toString());
    if (res_data['status']) {
      globalController.setLoading(false);
      Get.snackbar(res_data['message'], '');
    } else {
      globalController.setLoading(false);
      Get.snackbar(res_data['message'], "");
    }
  }

  Future deleteRoutineApi(context, rid) async {
    final globalController = Get.put(GlobalController());
    globalController.setLoading(true);

    print(RoutineId);
    //print(RoutineId);
    final uri = Uri.parse('${apiGlobal}user/deleteroutine/$rid');
    final headers = {
      'Content-Type': 'application/json',
      'authorization': newToken.toString()
    };

    http.Response response = await http.delete(
      uri,
      headers: headers,
    );
    var res_data = json.decode(response.body.toString());
    if (res_data['status']) {
      globalController.setLoading(false);
      Get.snackbar(res_data['message'], '');
    } else {
      globalController.setLoading(false);
      Get.snackbar(res_data['message'], "");
    }
  }
}
