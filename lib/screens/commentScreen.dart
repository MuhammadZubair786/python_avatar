import 'package:flutter/material.dart';
import 'package:chatbot_app/Api.dart';

import '../controllers/bottom_controller.dart';
import '../controllers/commentController.dart';
import '../export_all.dart';

import 'main_folder/custom_bottom_navigation.dart';

class CommentScreen extends StatefulWidget {
  String postID;
  CommentScreen({Key? key, required this.postID}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final commentController = Get.put(CommentController());
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        getPostCommentById(context);
      },
    );
  }

  Future<void> doComment(context, text) async {
    var res = await ApiService().commentPost(context, widget.postID, text);
    getPostCommentById(context);
  }

  Future<void> getPostCommentById(context) async {
    var res = await ApiService().getPostById(context, widget.postID.toString());

    commentController.addCommentData(res['userComments']);
  }

  Widget build(BuildContext context) {
    final bottomctrl = Get.put(BottomController());

    double res_height = MediaQuery.of(context).size.height;
    double res_width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            bottomctrl.navBarChange(0);
            Get.to(CustomBottomNavigation())!.then((value) {});
          },
          child: Container(
              width: res_width * 0.9,
              child: Icon(
                Icons.close,
                color: Color(0xFFFD6839),
              )
              ),
        ),
        title: Text(
          "Comments",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.all(20),
          child: txtfeild("Write a message..."),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GetBuilder<CommentController>(
                builder: (commentController) {
                  return commentController.isLoding
                      ? Center(
                          child: Image.asset(
                            "assets/Slicing/output-onlinegiftools.gif",
                            height: 125.0,
                            color: Colors.orange,
                            width: 125.0,
                          ),
                        )
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: commentController.commentsList[0].length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        "https://gymsta-api.jumppace.com:9000/" +
                                           commentController.commentsList[0][index]["user"]["image"]["file"].toString()),
                                  ),
                                  title: Text(
                                    commentController.commentsList[0][index]["user"]["fullName"].toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  subtitle: Text(
                                    commentController.commentsList[0][index]["text"],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                                Divider()
                              ],
                            );
                          },
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget txtfeild(hint) {
    return Container(
      height: 60.h,
      width: 360.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        border: Border.all(
          color: Color(
            0xffD1D1D1,
          ),
        ),
      ),
      child: TextFormField(
        controller: messageController,
        style: TextStyle(color: Colors.black),
        cursorColor: Color(0xff888888),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              doComment(context, messageController.text);
              messageController.clear();
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 43.h,
                width: 43.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: kprimary,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/Slicing/Android/4x/Icon awesome-paper-plane.png',
                    scale: 5,
                  ),
                ),
              ),
            ),
          ),
          isDense: true,
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xff888888), fontSize: 12.sp),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
