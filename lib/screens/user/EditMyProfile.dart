import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:chatbot_app/Api.dart';
import 'package:chatbot_app/export_all.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/bottom_controller.dart';
import '../main_folder/custom_bottom_navigation.dart';

class EditMyProfileScreen extends StatefulWidget {
  var certificatesPaths = [];

  EditMyProfileScreen({Key? key, required this.certificatesPaths})
      : super(key: key);

  @override
  State<EditMyProfileScreen> createState() => _EditMyProfileScreenState();
}

class _EditMyProfileScreenState extends State<EditMyProfileScreen> {
  final globalController = Get.put(GlobalController());

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    //print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
  }

  final bottomctrl = Get.put(BottomController());
  bool _isLoading = false;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userAgeController = TextEditingController();
  TextEditingController songNameController = TextEditingController();
  TextEditingController userAboutController = TextEditingController();
  TextEditingController userHobbiesController = TextEditingController();

  TextEditingController InstructorexperienceController =
      TextEditingController();
  TextEditingController InstructorskillsController = TextEditingController();
  TextEditingController InstructorworkingatController = TextEditingController();
  TextEditingController InstructorlocationController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  /// Variables
  File? imageFile;
  File? certificateFile;

  FilePickerResult? result;
  List<dynamic> files = [];

  /// Get from gallery
  _getFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    //print(pickedFile);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);

        userProfilePicture = imageFile;
        // var imagepath = userProfilePicture.split(':');

        //print("profileimage${imageFile}");
      });
    }
  }

  // List<File> convertStringPathsToFiles(List<String> paths) {
  //   List<File> files = [];
  //   paths.forEach((path) {
  //     File file = File(path);
  //     files.add(file);
  //   });

  //   return files;
  // }

  void initState() {
    profileData();
    _isLoading = true;
    super.initState();
  }

  dynamic ProfileDetails;

  profileData() async {
    ProfileDetails = await ApiService().getProfileDetails(userId, userType);
    //print(' ProfileData  ${ProfileDetails}');
    if (ProfileDetails.length > 0) {
      setState(() {
        _isLoading = false;
      });
    }

    userType == "Customer"
        ? setState(() {
            fullNameController.text = ProfileDetails['data']['fullName'];
            userAgeController.text = ProfileDetails['data']['age'].toString();
            songNameController.text = ProfileDetails['data']['song'];
            userAboutController.text = ProfileDetails['data']['bio'];
            userHobbiesController.text = ProfileDetails["data"]["hobies"];
          })
        : setState(() {
            fullNameController.text = ProfileDetails['data']['fullName'];
            userAgeController.text = ProfileDetails['data']['age'].toString();
            InstructorexperienceController.text =
                ProfileDetails['data']['experience'];
            InstructorskillsController.text = ProfileDetails['data']['skills'];

            InstructorworkingatController.text =
                ProfileDetails['data']['workingAt'];
            userAboutController.text = ProfileDetails['data']['bio'];
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Edit My Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Image(
              image: AssetImage(
                "assets/Slicing/Android/4x/Icon ionic-ios-arrow-back-13.png",
              ),
            ),
          ),
        ),
      ),
      body: _isLoading
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/Slicing/output-onlinegiftools.gif",
                    height: 125.0,
                    color: Colors.orange,
                    width: 125.0,
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    20.verticalSpace,
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomRight,
                      children: [
                        ProfileDetails['data']['image']['file'] != "" &&
                                ProfileDetails['data']['image']['file'] != null
                            ? Container(
                                width: 137.w,
                                height: 137.h,
                                decoration: imageFile == null
                                    ? BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 3.r,
                                          color: Color(0xffFD6839),
                                        ),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://gymsta-api.jumppace.com:9000/' +
                                                    ProfileDetails['data']
                                                        ['image']['file'])))
                                    : BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 3.r,
                                          color: Color(0xffFD6839),
                                        ),
                                        image: DecorationImage(
                                            image: FileImage(
                                                File(imageFile!.path)))),
                              )
                            : Container(
                                width: 137.w,
                                height: 137.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 3.r,
                                    color: Color(0xffFD6839),
                                  ),
                                  image: imageFile == null
                                      ? DecorationImage(
                                          image: AssetImage(
                                            "assets/Slicing/Android/4x/Ellipse -2.png",
                                          ),
                                        )
                                      : DecorationImage(
                                          image: FileImage(imageFile!),
                                          fit: BoxFit.fill),
                                ),
                              ),
                        Positioned(
                          bottom: 10,
                          child: GestureDetector(
                            onTap: () {
                              _getFromGallery();
                            },
                            child: Container(
                              width: 32.w,
                              height: 32.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange,
                              ),
                              child: Image(
                                image: AssetImage(
                                    "assets/Slicing/Android/drawable-hdpi/Icon awesome-camera.png"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30.h),
                    SizedBox(height: 50.h),
                    Container(
                      width: 356.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            offset: Offset(0, 0),
                          ),
                        ],
                        border: Border.all(color: Color(0xffD2D2D2)),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: TextFormField(
                        controller: fullNameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          hintText: "Full Name",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      width: 356.w,
                      height: 56.h,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            offset: Offset(0, 0),
                          ),
                        ],
                        border: Border.all(color: Color(0xffD2D2D2)),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: userAgeController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          hintText: "Age",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    userType == "Customer"
                        ? SizedBox(height: 12.h)
                        : Container(),
                    userType == "Customer"
                        ? Container(
                            width: 356.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  offset: Offset(0, 0),
                                ),
                              ],
                              border: Border.all(color: Color(0xffD2D2D2)),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: TextFormField(
                              controller: songNameController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(16),
                                hintText: "Enter Song Name",
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        : Container(),
                    userType == "Customer"
                        ? SizedBox(height: 12.h)
                        : Container(),
                    userType == "Customer"
                        ? Container(
                            width: 356.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  offset: Offset(0, 0),
                                ),
                              ],
                              border: Border.all(color: Color(0xffD2D2D2)),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: TextFormField(
                              controller: userHobbiesController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(16),
                                hintText: "Enter Hobbies",
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        : Container(),
                    userType == "Instructor"
                        ? SizedBox(height: 12.h)
                        : Container(),
                    userType == "Instructor"
                        ? Container(
                            width: 356.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  offset: Offset(0, 0),
                                ),
                              ],
                              border: Border.all(color: Color(0xffD2D2D2)),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: TextFormField(
                              controller: InstructorexperienceController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(16),
                                hintText: "Experience",
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        : Container(),
                    userType == "Instructor"
                        ? SizedBox(height: 12.h)
                        : Container(),
                    userType == "Instructor"
                        ? Container(
                            width: 356.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  offset: Offset(0, 0),
                                ),
                              ],
                              border: Border.all(color: Color(0xffD2D2D2)),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: TextFormField(
                              controller: InstructorskillsController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(16),
                                hintText: "Skills",
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(height: 12.h),
                    userType == "Instructor"
                        ? Container(
                            width: 356.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  offset: Offset(0, 0),
                                ),
                              ],
                              border: Border.all(color: Color(0xffD2D2D2)),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: TextFormField(
                              controller: InstructorworkingatController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(16),
                                hintText: "Working at",
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(height: 12.h),
                    userType == "Instructor"
                        ? Padding(
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
                                              itemCount:
                                                  _spc.listImagePath.length,
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
                                                        File(_spc.listImagePath[
                                                            index]),
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
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Color(
                                                                  0xffD43131)),
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.close,
                                                              color:
                                                                  Colors.white,
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
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
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
                                    ),
                            ),
                          )
                        : Container(),
                    SizedBox(height: 12.h),
                    Container(
                      width: 356.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0, 0),
                          ),
                        ],
                        border: Border.all(color: Color(0xffD2D2D2)),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: TextFormField(
                        maxLines: 3,
                        controller: userAboutController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          hintText: "Enter Bio \n",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    userType == "Customer"
                        ? GestureDetector(
                            onTap: () async {
                              check = 'editProfile';

                              if (fullNameController.text.isEmpty ||
                                  userAgeController.text.isEmpty ||
                                  songNameController.text.isEmpty ||
                                  userHobbiesController.text.isEmpty ||
                                  userAboutController.text.isEmpty) {
                                Get.snackbar('Error',
                                    "Please Enter All Values With Correct Format",
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.white,
                                    colorText: Colors.black);
                              } else {
                                setState(() {
                                  _isLoading = true;
                                });
                                var data = {
                                  'fullName': fullNameController.text,
                                  'age': userAgeController.text,
                                  'song': songNameController.text,
                                  'bio': userAboutController.text,
                                  "hobies": userHobbiesController.text
                                  // 'imageFile': imageFile,
                                };
                                var res_data = await ApiService().updateProfile(
                                    context, data, imageFile?.path, null);

                                if (res_data['status']) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
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
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Save",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () async {
                              check = 'editProfile';

                              if (fullNameController.text.isEmpty ||
                                  userAgeController.text.isEmpty ||
                                  userAboutController.text.isEmpty ||
                                  InstructorexperienceController.text.isEmpty ||
                                  InstructorskillsController.text.isEmpty ||
                                  InstructorworkingatController.text.isEmpty) {
                                Get.snackbar('Error',
                                    "Please Enter All Values With Correct Format",
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.white,
                                    colorText: Colors.black);
                              } else {
                                setState(() {
                                  _isLoading = true;
                                });
                                var data = {
                                  'fullName': fullNameController.text,
                                  'age': userAgeController.text,
                                  'bio': userAboutController.text,
                                  'experience':
                                      InstructorexperienceController.text,
                                  'skills': InstructorskillsController.text,
                                  'workingAt':
                                      InstructorworkingatController.text,
                                };
                                var res = await ApiService().updateProfile(
                                    context,
                                    data,
                                    imageFile?.path,
                                    globalController.listImagePath);

                                if (res['status']) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
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
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Save",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                    50.verticalSpace,
                    Container(
                      child: Center(),
                    ),
                  ]),
            ),
    );
  }
}
