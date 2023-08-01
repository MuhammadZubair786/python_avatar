import 'package:flutter/material.dart';
import 'package:chatbot_app/Api.dart';

import '../controllers/bottom_controller.dart';
import '../controllers/commentController.dart';
import '../export_all.dart';

import 'main_folder/custom_bottom_navigation.dart';

class CommentScreen1 extends StatefulWidget {
  String postID;
  CommentScreen1({Key? key, required this.postID}) : super(key: key);

  @override
  State<CommentScreen1> createState() => _CommentScreen1State();
}

class _CommentScreen1State extends State<CommentScreen1> {
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


   void _modalBottomSheetMenu(context,commentid,index){
        showModalBottomSheet(
            context: context,
            builder: (builder){
            
              return new Container(
              height: 80,
                color: Colors.transparent, //could change this to Color(0xFF737373), 
                           //so you don't have to change MaterialApp canvasColor
                child: new Container(
                  padding: EdgeInsets.all(10),
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0))),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        ApiService().deleteCommentApi(context,commentid,index);
                      },
                      child: ListTile(
                        leading: Icon(Icons.delete),
                        title: new Text("Delete Comment",style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    )),
              );
            }
        );
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
            bottomctrl.navBarChange(4);
            Get.to(CustomBottomNavigation())!.then((value) {});
          },
          child: Container(
              width: res_width * 0.9,
              child: Icon(
                Icons.close,
                color: Color(0xFFFD6839),
              )
              //  Image.asset(
              //   "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
              //   scale: 4.5,
              // ),
              ),
        ),
        title: Text(
          "Comments",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      //   child: Container(
      //     padding: EdgeInsets.all(20),
      //     child: txtfeild("Write a message..."),
      //   ),
      // ),
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
                                GestureDetector(
                                  onLongPress: (){
                                     _modalBottomSheetMenu(context,commentController.commentsList[0][index]["_id"],index);
                                  },
                                  child: ListTile(
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
                                  //   trailing: GestureDetector(
                                  //     onLongPress: (){
                                  //  _modalBottomSheetMenu();
                                  //     //   print( commentController.commentsList[0][index]["_id"]);
                                
                                  //     // ApiService().deleteCommentApi(context,commentController.commentsList[0][index]["_id"],index);
                                
                                     
                                  //     },
                                  //     child: Icon(Icons.delete,color: Colors.red,)),
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
