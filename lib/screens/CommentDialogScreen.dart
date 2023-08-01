import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chatbot_app/screens/home_screen.dart';

import '../Api.dart';

class CommentDialogScreen extends StatefulWidget {
  String postId;
  CommentDialogScreen({super.key, required this.postId});

  @override
  State<CommentDialogScreen> createState() => _CommentDialogScreenState();
}

class _CommentDialogScreenState extends State<CommentDialogScreen> {
  //
  TextEditingController messageController = TextEditingController();

  Future<void> doComment(context, text) async {
    var res = await ApiService().commentPost(context, widget.postId, text);
    if (res != null) {
      Get.to(() => HomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1.sw,
        height: 1.sh,
        color: Color.fromARGB(180, 0, 0, 0),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r)),
              child: Container(
                height: 320.h,
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      title: Container(
                        margin: EdgeInsets.only(left: 35),
                        child: Center(
                          child: Text(
                            "COMMENT",
                            style: TextStyle(
                              fontFamily: "Arial",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF1D1D1D66),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                        child: TextFormField(
                          onFieldSubmitted: (value) {
                            //print("TEXT: " +
                                // messageController.text +
                                // "\n POST ID: " +
                                // widget.postId);
                            doComment(context, messageController.text);
                          },
                          keyboardType: TextInputType.text,
                          controller: messageController,
                          maxLines: 7,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15),
                              border: InputBorder.none,
                              hintText: "Type your comment here...",
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 15.sp)
                              // hintStyle: interRegular14greyOpacity50,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

//  AlertDialog(
//             // insetPadding: EdgeInsets.zero,
//             contentPadding: const EdgeInsets.all(0),
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             content: Scaffold(

//               bottomNavigationBar: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                     color: Colors.red,
//                     child: Text("hh"),
//                   )
//                 ],
//               ),
//             )),
