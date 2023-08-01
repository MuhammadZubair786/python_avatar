import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/controllers/bottom_controller.dart';
import 'package:chatbot_app/widgets/custom_menu_widget.dart';
import 'package:image_picker/image_picker.dart';

import '../../export_all.dart';

class CreateNewPostScreen extends StatefulWidget {
  const CreateNewPostScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPostScreen> createState() => _CreateNewPostScreenState();
}

class _CreateNewPostScreenState extends State<CreateNewPostScreen> {
  final bottomctrl = Get.put(BottomController());
  final ImagePicker _picker = ImagePicker();
  File? uploadFile;
  TextEditingController captionController = TextEditingController();
  bool isImage = true;

  /// Get from gallery
  _getFromGallery(bool isImageSelected) async {
    XFile? pickedFile;
    if (isImageSelected) {
      pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
    } else {
      pickedFile = await _picker.pickVideo(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        File tempFile = File(pickedFile.path);
        int sizeInBytes = tempFile.lengthSync();
        log('SizeVideo: $sizeInBytes');
        if (sizeInBytes > allowedVideFileSizeInBytes) {
          Get.snackbar('Error', "Video File cannot be greater than 10Mb");
          return;
        }
      }
    }

    if (pickedFile != null) {
      setState(() {
        uploadFile = File(pickedFile!.path);
      });
      log('UPLOAD FILE: ${uploadFile}');
    }
  }

  @override
  Widget build(BuildContext context) {
    double res_height = MediaQuery.of(context).size.height;
    double res_width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: res_width * 0.9,
            child: Image.asset(
              "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-12.png",
              scale: 4.5,
            ),
          ),
        ),
        title: Text(
          "Create New Post",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(child: GetBuilder<GlobalController>(
          builder: (controller) {
            return controller.isLoding
                ? Center(
                    child: Image.asset(
                      "assets/Slicing/output-onlinegiftools.gif",
                      height: 125.0,
                      color: Colors.orange,
                      width: 125.0,
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        width: 356.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          color: Colors.white,
                          border: Border.all(color: Color(0xffD2D2D2)),
                        ),
                        child: TextFormField(
                          controller: captionController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            hintText: "caption",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: () {
                          CustomMenuWidget.showBottomSheet(context, [
                            CustomMenuTile(
                                onTapped: () {
                                  _getFromGallery(true);
                                  setState(() {
                                    isImage = true;
                                  });
                                  Navigator.pop(context);
                                },
                                text: 'Upload Photo'),
                            CustomMenuTile(
                                onTapped: () {
                                  _getFromGallery(false);
                                  setState(() {
                                    isImage = false;
                                  });
                                  Navigator.pop(context);
                                },
                                text: 'Upload Video')
                          ]);
                        },
                        child: Container(
                          width: 356.w,
                          height: 84.h,
                          decoration: BoxDecoration(
                            gradient: kprimary,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Upload Photo/Video",
                                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      if (uploadFile != null)
                        Text(
                          '1 file selected',
                          style: TextStyle(color: black, fontSize: 18),
                        ),
                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: () {
                          if (captionController.text.isEmpty) {
                            Get.snackbar("Error", "Please enter caption");
                          } else if (uploadFile == null) {
                            Get.snackbar("Error", "Please select an image or video");
                          } else {
                            print(captionController.text);
                            print(uploadFile!);
                            print( isImage);
                            ApiService().createNewPost(context, captionController.text, uploadFile!, isImage);
                          }

                          // if (bottomctrl.navigationBarIndexValue != 0) {
                          //   bottomctrl.navBarChange(0);
                          // } else {
                          //   Get.back();
                          // }
                        },
                        child: Container(
                          width: 356.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                            gradient: kprimary,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
          },
        )),
      ),
    );
  }
}
