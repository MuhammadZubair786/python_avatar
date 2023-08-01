import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// enum USERTYPE { instructor, customer, none }

var userexperience = "";
var userType = "";
var userId = "";
var notification=false;

var username = "";
var follower = "";
var following = "";

var resisteremail ="";

dynamic posts;
var userage = '';
var song = '';
var userbio = '';
var deviceToken;
var deviceType;
// var AuthToken;
var userProfilePicture;
String userprofileendpoint = '';
var userprofileimage = 'https://gymsta-api.jumppace.com:9000/${userprofileendpoint}';

var userabout;

var newToken = "abc";
var notifire = 'clear';
var instructornotifire = 'clear';
var dietId = "";
var RoutineId="";

var dietRequestUserType = "";

var dietRequestUserId = "";
List dietEntries = [];
String startDate = "", endDate = "";

const constScreenHorizontal = 16.0;

///10Mb
const allowedVideFileSizeInBytes = 10000000;

///Icons
const fbIcon = 'assets/icons/facebook.svg';
const googleIcon = 'assets/icons/google.svg';
const appleIcon = 'assets/icons/apple.svg';

///Images
const userTypeImage = 'assets/images/user_image.jpg';
var userImage = 'assets/images/user_image.jpg';

const trainerImage = 'assets/images/trainer_image.jpg';
const trainerImageGirl = 'assets/images/trainer_image_girl.jpg';


var spinkit = SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
);
