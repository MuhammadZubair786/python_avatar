// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, non_constant_identifier_names, unnecessary_new, unused_local_variable, unnecessary_brace_in_string_interps, deprecated_member_use, use_build_context_synchronously, depend_on_referenced_packages

import 'dart:io';
import 'package:chatbot_app/screens/OnBoarding/Regsister/Login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../../export_all.dart';
import 'package:path/path.dart' as path;

class SignUpUser extends StatefulWidget {
  const SignUpUser({super.key});

  @override
  State<SignUpUser> createState() => _SignUpUserState();
}

class _SignUpUserState extends State<SignUpUser> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool showDropDownValidation = false;

  final fullNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  final userConfirmPassController = TextEditingController();
  String passwordChecker = "";
  String? selectedValue;
  List items = ['Customer', 'Instructor'];

  File? imageFile;

  final ImagePicker _picker = ImagePicker();

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

  authCreateUser() async {
    print("test");
    FirebaseAuth auth = FirebaseAuth.instance;

    if (fullNameController.text == '') {
      Get.snackbar(
        'Error',
        "Enter Your Name",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.white,
        colorText: Colors.black,
      );
    } else if (userEmailController.text == "") {
      Get.snackbar(
        'Error',
        "Enter Email Address",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.white,
        colorText: Colors.black,
      );
    } else if (userPasswordController.text == "") {
      Get.snackbar(
        'Error',
        "Enter Password",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.white,
        colorText: Colors.black,
      );
    } else if (userConfirmPassController.text == "") {
      Get.snackbar(
        'Error',
        "Enter Confirm Password",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.white,
        colorText: Colors.black,
      );
    } else if (userConfirmPassController.text != userPasswordController.text) {
      Get.snackbar(
        'Error',
        "Enter Password and Confirm Password Mismatch",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.white,
        colorText: Colors.black,
      );
    } else if (imageFile == null) {
      Get.snackbar(
        'Error',
        "Select User Image File",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.white,
        colorText: Colors.black,
      );
    } else {
      try {

   showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return spinkit;
        });
          UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
                email: userEmailController.text,
                password: userPasswordController.text);
        String User_Uid = userCredential.user!.uid;

        String ImageName = path.basename(imageFile!.path);
        firebase_storage.Reference ref =
            firebase_storage.FirebaseStorage.instance.ref('Images/$ImageName');
        File file = File(imageFile!.path);

        await ref.putFile(file);

        String downlaodURL = await ref.getDownloadURL();

      print(downlaodURL);

        DatabaseReference userRef =
            FirebaseDatabase.instance.ref().child('Users/${User_Uid}');
        var date = new DateTime.now().toString();

        var dateParse = DateTime.parse(date);

        var formattedDate =
            "${dateParse.day}-${dateParse.month}-${dateParse.year}";

        var data = {
          "fullName": fullNameController.text.trim(),
          "email": userEmailController.text.trim(),
          "password": userPasswordController.text.trim(),
          "uid": User_Uid,
          "create_date": formattedDate,
          "img_link": downlaodURL
        };

           await userRef.set(data);
          Get.back();
        Get.snackbar(
          'Success',
          "User Register Successfully ",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black,
        );
        Get.to(()=>LoginUser());
      } catch (E) {
        Get.back();
        Get.snackbar(
          'Error',
          E.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          colorText: Colors.black,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(color: grey),
        child: Form(
          key: _form,
          child: Scaffold(
              backgroundColor: grey,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CircleAvatar(
                          radius: 30,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/Slicing/Android/drawable-hdpi/logo-5.jpg",
                            ),
                          ),
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40.w,
                            ),
                            Container(
                              child: Text(
                                "Create Account",
                                style: TextStyle(
                                    color: bprimary,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),

                            SizedBox(height: 26.h),

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
                                          backgroundImage:
                                              FileImage(imageFile!),
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
                                    fillColor: Color.fromARGB(255, 4, 65, 114),
                                    child: Image.asset(
                                      "assets/Slicing/Android/drawable-hdpi/Icon awesome-camera.png",
                                    ),
                                    padding: EdgeInsets.all(2),
                                    shape: CircleBorder(),
                                  ),
                                ),
                              ],
                            ),
                            // Container(
                            //   margin: EdgeInsets.symmetric(horizontal: 119.r),
                            //   child: Image(image: AssetImage("assets/Slicing/Android/4x/Ellipse 18.png")),
                            // ),
                            SizedBox(height: 30.h),

                            Container(
                              width: 356.w,
                              child: TextFormField(
                                controller: fullNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "* Required";
                                  }
                                },
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 235, 226, 237)
                                      .withOpacity(0.3),
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  hintText: 'Full Name',
                                  hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: bprimary,
                                    size: 27.r,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              width: 356.w,
                              child: TextFormField(
                                controller: userEmailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "* Required";
                                  }
                                },
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 235, 226, 237)
                                      .withOpacity(0.3),
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  hintText: 'Email Address',
                                  hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: bprimary,
                                    size: 27.r,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),

                            SizedBox(height: 12.h),
                            Container(
                              width: 356.w,
                              child: TextFormField(
                                obscureText: true,
                                controller: userPasswordController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "* Required";
                                  }
                                  return null;
                                },
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 235, 226, 237)
                                      .withOpacity(0.3),
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: bprimary,
                                    size: 27.r,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Container(
                              width: 356.w,
                              child: TextFormField(
                                obscureText: true,
                                controller: userConfirmPassController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "* Required";
                                  } else if (userConfirmPassController.text
                                          .trim() !=
                                      userPasswordController.text.trim()) {
                                    return 'Please Enter a Correct Password';
                                  }
                                  return null;
                                },
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.sp),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromARGB(255, 235, 226, 237)
                                      .withOpacity(0.3),
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: bprimary, width: 2.sp),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: bprimary,
                                    size: 27.r,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h),
                            GestureDetector(
                              onTap: () async {
                                // Get.to(() => LoginUser());
                                // log('valud; $selectedValue');
                                // if (_form.currentState!.validate() &&
                                //     selectedValue != null) {
                                //   setState(() {
                                //     showDropDownValidation = false;
                                //   });

                                authCreateUser();
                                //   var data = {
                                //     "fullName": fullNameController.text.trim(),
                                //     "email": userEmailController.text.trim(),
                                //     "password": userPasswordController.text.trim(),
                                //     "confirmpassword": userConfirmPassController.text.trim(),
                                //     "userType": selectedValue.toString(),
                                //     "deviceToken": deviceToken.toString(),
                                //     "deviceType": deviceType
                                //   };

                                //   await ApiService().callRegister(context, data);
                                // } else {
                                //   setState(() {
                                //     showDropDownValidation = true;
                                //   });
                                // }
                              },
                              child: Container(
                                width: 356.w,
                                height: 65.h,
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
                                        "Signup",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25.h),
                            Text(
                              "OR",
                              style: TextStyle(
                                color: bprimary,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(height: 25.h),
                            SocialMediasWidget(),
                            30.verticalSpace,
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/LoginScreen');
                              },
                              child: Container(
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Already have an account?',
                                        ),
                                        TextSpan(
                                            text: ' Login',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              )),
        ));
  }
}
