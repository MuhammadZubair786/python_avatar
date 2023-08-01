import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';


import 'package:chatbot_app/Api.dart';
import 'package:image_picker/image_picker.dart';

import '../../export_all.dart';

class CreateProfileScreen extends StatefulWidget {
  final int userType;

  CreateProfileScreen({Key? key, required this.userType}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final ImagePicker _picker = ImagePicker();

  void initState() {
    super.initState();

    fullNameController.text = username;
    listempty();
  }

  listempty() {
    globalController.images = [];
    globalController.listImagePath = [];
    setState(() {});
  }

  /// Variables
  File? imageFile;
  File? certificateFile;

  FilePickerResult? result;
  List<dynamic> files = [];

  var done = false;

  /// Get from gallery
  _getFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    //print(pickedFile);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  final fullNameController = TextEditingController();
  final ageController = TextEditingController();
  final songNameController = TextEditingController();
  final hobbiesController = TextEditingController();
  final bioController = TextEditingController();
  final experienceController = TextEditingController();
  final skillsController = TextEditingController();
  final workingAtController = TextEditingController();
  final locationController = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  final globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage("assets/Slicing/Android/drawable-hdpi/Group 240.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Complete Profile"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Image(
                image: AssetImage(
                  "assets/Slicing/Android/drawable-hdpi/Icon ionic-ios-arrow-back-1.png",
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _form,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.h),
                    Stack(
                      children: [
                        Container(
                          width: 200.r,
                          height: 200.r,
                          child: imageFile == null
                              ? Image(
                                  image: AssetImage(
                                    "assets/Slicing/Android/drawable-hdpi/Icon awesome-user-alt-1.png",
                                  ),
                                  width: 90.w,
                                  height: 190,
                                )
                              : CircleAvatar(
                                  backgroundImage: FileImage(imageFile!),
                                ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.5),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.5,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -6,
                          right: -14,
                          child: RawMaterialButton(
                            onPressed: () {
                              _getFromGallery();
                            },
                            elevation: 2.0,
                            fillColor: Colors.orange,
                            child: Image.asset(
                              "assets/Slicing/Android/drawable-hdpi/Icon awesome-camera.png",
                            ),
                            padding: EdgeInsets.all(2),
                            shape: CircleBorder(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    TextBox("Full Name", fullNameController),
                    SizedBox(height: 12.h),
                    TextBox("Age", ageController),
                    if (widget.userType == 1) ...{
                      SizedBox(height: 12.h),
                      TextBox("Experience", experienceController),
                      SizedBox(height: 12.h),
                      TextBox("Skills", skillsController),
                      SizedBox(height: 12.h),
                      TextBox("Working at", workingAtController),
                      SizedBox(height: 12.h),
                      TextBox("Location", locationController),
                      12.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: GetBuilder<GlobalController>(
                          builder: (_spc) => _spc.listImagePath.isNotEmpty
                              ? Column(
                                  children: [
                                    Container(
                                      height: 100.h,
                                      padding: EdgeInsets.only(left: 35),
                                      child: GridView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount: _spc.listImagePath.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 5,
                                                  crossAxisSpacing: 8,
                                                  mainAxisSpacing: 8),
                                          itemBuilder: (contex, index) {
                                            return Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.file(
                                                    File(_spc
                                                        .listImagePath[index]),
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Positioned(
                                                  right: -0.5,
                                                  top: 0,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      _spc.removeImageFromFilePath(
                                                          index);
                                                    },
                                                    child: Container(
                                                      height: 23.h,
                                                      width: 23.w,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Color(
                                                              0xffD43131)),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.close,
                                                          color: Colors.white,
                                                          size: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (globalController
                                                .listImagePath.length >=
                                            3) {
                                          Get.snackbar(
                                            'Error',
                                            "You can add upto 3 certificates",
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor: Colors.white,
                                          );
                                        } else {
                                          globalController
                                              .pickMultipleImages(context);
                                        }
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
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Upload Certification",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : GestureDetector(
                                  onTap: () {
                                    globalController
                                        .pickMultipleImages(context);
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Upload Certification",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () async {
                      //     XFile? pickedFile = await _picker.pickImage(
                      //       source: ImageSource.gallery,
                      //     );
                      //     //print(pickedFile);
                      //     if (pickedFile != null) {
                      //       setState(() {
                      //         certificateFile = File(pickedFile.path);
                      //       });
                      //       // //print("aaaa"+imageFile.runtimeType.);
                      //     }
                      //   },
                      //   child: Container(
                      //     width: 356.w,
                      //     height: 84,
                      //     decoration: BoxDecoration(
                      //       gradient: kprimary,
                      //       boxShadow: [
                      //         BoxShadow(
                      //           offset: Offset(0, 0),
                      //         ),
                      //       ],
                      //       borderRadius: BorderRadius.circular(20.r),
                      //     ),
                      //     child: Center(
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Text(
                      //             "Upload Certification",
                      //             style: TextStyle(color: Colors.white, fontSize: 15.sp),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // )
                    },
                    if (widget.userType == 0) ...{
                      SizedBox(height: 12.h),
                      TextBox("Enter Song Name", songNameController),
                      SizedBox(height: 12.h),
                      TextBox("Hobbies", hobbiesController),
                    },
                    SizedBox(height: 12.h),
                    Container(
                      width: 356.w,
                      child: TextFormField(
                        maxLines: 3,
                        controller: bioController,
                        style: TextStyle(color: Colors.white, fontSize: 15.sp),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 29.r, vertical: 19.r),
                            hintText: "Bio",
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 15.sp),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.sp),
                              borderRadius: BorderRadius.circular(28.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.sp),
                              borderRadius: BorderRadius.circular(28.r),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.sp),
                              borderRadius: BorderRadius.circular(28.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.sp),
                              borderRadius: BorderRadius.circular(28.r),
                            )),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    GestureDetector(
                      onTap: () {
                        //print("dnfjndf");
                        //print(widget.userType);
                        if (_form.currentState!.validate()) {
                          if (widget.userType == 1) {
                            check = 'completeProfile';
                            //user type == 1 [Instructor]

                            var data = {
                              'fullName': fullNameController.text,
                              'age': ageController.text,
                              'experience': experienceController.text,
                              'skills': skillsController.text,
                              'bio': bioController.text,
                              'workingAt': workingAtController.text,
                              'address': locationController.text
                            };
                            //print(data);

                            if (imageFile == null) {
                              Get.snackbar(
                                  'Error', 'Please upload Profile Image',
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(seconds: 3),
                                  colorText: white);
                              done = false;
                            } else if (globalController.listImagePath.isEmpty) {
                              Get.snackbar('Error', 'Please upload certificate',
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(seconds: 3),
                                  colorText: white);
                            } else if (bioController.text.isEmpty) {
                              Get.snackbar('Error', 'Please Enter Bio',
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(seconds: 3),
                                  colorText: white);
                            } else {
                              done = true;
                              ApiService().updateProfile(
                                  context,
                                  data,
                                  imageFile!.path,
                                  globalController.listImagePath);
                            }
                          } else {

                               if (imageFile == null) {
                              Get.snackbar(
                                  'Error', 'Please upload Profile Image',
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(seconds: 3),
                                  colorText: white);
                              done = false;
                            }  else if (bioController.text.isEmpty) {
                              Get.snackbar('Error', 'Please Enter Bio',
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: Duration(seconds: 3),
                                  colorText: white);
                            } else {
                              done = true;

                                  
                              // ApiService().updateProfile(
                              //     context,
                              //     data,
                              //     imageFile!.path,
                              //     globalController.listImagePath);
                            }
                            check = 'completeProfile';
                            var data = {
                              'fullName': fullNameController.text,
                              'age': ageController.text,
                              'song': songNameController.text,
                              'hobies': hobbiesController.text,
                              'bio': bioController.text,
                            };

                             ApiService().updateProfile(
                                  context, data, imageFile!.path, null);
                            }

                          //   if (imageFile == null) {
                          //     Get.snackbar(
                          //         'Error', 'Please upload image to continue',
                          //         snackPosition: SnackPosition.BOTTOM,
                          //         duration: Duration(seconds: 3),
                          //         colorText: white);
                          //   } else {
                          //     ApiService().updateProfile(
                          //         context, data, imageFile!.path, null);
                          //   }
                          
                        }
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
                        alignment: Alignment.center,
                        child: Text(
                          "Create Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    40.verticalSpace
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  TextBox(hintText, contr) {
    // print(contr==ageController);
    return Container(
      width: 356.w,
      // height: 56.h,
      decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     offset: Offset(0, 0),
          //   ),
          // ],

          ),
      child: TextFormField(
        enabled: contr == fullNameController ? false : true,
        keyboardType:
            contr == ageController ? TextInputType.number : TextInputType.text,
        controller: contr,
        validator: (value) {
          if (value! == "") {
            return "* Required";
          }
          // return null;
        },
        style: TextStyle(color: Colors.white, fontSize: 15.sp),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.3),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 29.r),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white, fontSize: 15.sp),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.sp),
              borderRadius: BorderRadius.circular(50.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.sp),
              borderRadius: BorderRadius.circular(50.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.sp),
              borderRadius: BorderRadius.circular(50.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.sp),
              borderRadius: BorderRadius.circular(50.r),
            )),
      ),
    );
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);
