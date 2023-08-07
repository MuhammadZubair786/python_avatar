// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'dart:io';

import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/screens/OnBoarding/OnBoardingScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chatbot_app/helper/notification_service.dart';
import 'package:chatbot_app/screens/PostLikes.dart';
import 'package:chatbot_app/screens/auth/create_profile_screen.dart';
import 'package:chatbot_app/screens/auth/forgot_password_screen.dart';
import 'package:chatbot_app/screens/auth/login_screen.dart';
import 'package:chatbot_app/screens/auth/otp_screen.dart';
import 'package:chatbot_app/screens/auth/reset_password_screen.dart';
import 'package:chatbot_app/screens/auth/signup_screen.dart';
import 'package:chatbot_app/screens/auth/social_login_screen.dart';
import 'package:chatbot_app/screens/main_folder/example.dart';
import 'package:chatbot_app/screens/search_screen.dart';
import 'package:chatbot_app/screens/terms_conditions/privacy_policy_screen.dart';
import 'package:chatbot_app/screens/terms_conditions/terms_conditions_screen.dart';
import 'package:chatbot_app/screens/user/userDiets.dart';
import 'package:chatbot_app/screens/user_selection_screen.dart';
import 'package:chatbot_app/trainer/CreateCustomerPlans.dart';
import 'package:chatbot_app/trainer/CustomerRoutine.dart';
import 'package:chatbot_app/trainer/Edit%20DietPlansSubscription.dart';
import 'package:chatbot_app/trainer/NutritionTracking.dart';
import 'package:chatbot_app/trainer/RequestFollower.dart';
import 'package:chatbot_app/trainer/Subscriptions.dart';
import 'package:chatbot_app/trainer/TrainerDietPlan1Screen.dart';
import 'package:chatbot_app/trainer/trainerhistory.dart';
import 'package:chatbot_app/trainer/trainerhistoryplans.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/global.dart';
import 'screens/NewDietPlan.dart';
import 'screens/ReportDietPlan.dart';
import 'screens/ReportRoutinePlan.dart';
import 'screens/Routine17.dart';
import 'screens/Routine19.dart';
import 'screens/SelectPaymentScreen.dart';
import 'screens/home_screen.dart';
import 'screens/main_folder/custom_bottom_navigation.dart';
import 'screens/main_folder/drawer.dart';
import 'screens/myroutine.dart';
import 'screens/terms_conditions/change_password_screen.dart';
import 'screens/user/Chat.dart';
import 'screens/user/CreateNewPost.dart';
import 'screens/user/DietPlan.dart';
import 'screens/user/DietPlan1.dart';
import 'screens/user/EditMyProfile.dart';
import 'screens/user/History.dart';
import 'screens/user/MyProfile.dart';
import 'screens/user/Notifications.dart';
import 'screens/user/NutritionalReportPlan.dart';
import 'screens/user/NutritionalTracking.dart';
import 'screens/user/Routine.dart';
import 'screens/user/Routine1.dart';
import 'screens/user/Settings.dart';
import 'screens/user/SubscriptionUser.dart';
import 'screens/user/TrainerProfile.dart';
import 'screens/user/messages.dart';
import 'screens/user/nutritiontrackingmeal.dart';
import 'trainer/CustomerRequests.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  // );
  HttpOverrides.global = new MyHttpOverrides();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // FireBaseNotificationServices notificationServices =
  //     FireBaseNotificationServices();

  void initState() {
    super.initState();
    // notificationServices.requestNotificationPermission();
    // notificationServices.forgroundMessage();
    // notificationServices.firebaseInit(context);
    // notificationServices.setupInteractMessage(context);
    // notificationServices.isTokenRefresh();
    //   _connectSocket();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
            textTheme: GoogleFonts.barlowTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          initialRoute: '/SplashScreen',
          getPages: [
            GetPage(
              name: '/SelectPaymentScreen',
              page: (() => SelectPaymentScreen()),
            ),
            GetPage(
              name: '/ReportDietPlan',
              page: (() => ReportDietPlan()),
            ),
            GetPage(
              name: '/NutritionalReportTrackingScreen',
              page: (() => NutritionalReportTrackingScreen()),
            ),
            GetPage(
              name: '/ReportRoutinePlanScreen',
              page: (() => ReportRoutinePlanScreen()),
            ),
            GetPage(
              name: '/NewDietPlanScreen',
              page: (() => NewDietPlanScreen()),
            ),
            GetPage(
              name: '/Routine17Screen',
              page: (() => Routine17Screen()),
            ),
            GetPage(
              name: '/SubscriptionUserScreen',
              page: (() => SubscriptionUserScreen()),
            ),
            GetPage(
              name: '/trainerhistoryplans',
              page: (() => trainerhistoryplans()),
            ),
            GetPage(
              name: '/EdidDietPlansSubscriptionScreen',
              page: (() => EdidDietPlansSubscriptionScreen()),
            ),
            GetPage(
              name: '/DietPlan1Screen',
              page: (() => DietPlan1Screen()),
            ),
            GetPage(
              name: '/NutritionTrackingScreen',
              page: (() => NutritionTrackingScreen()),
            ),
            GetPage(
              name: '/CustomerRoutine',
              page: (() => CustomerRoutine()),
            ),
            GetPage(
              name: '/CreateCustomerPlansScreen',
              page: (() => CreateCustomerPlansScreen()),
            ),
            GetPage(
              name: '/NutritiontrackingMealScreen',
              page: (() => NutritiontrackingMealScreen()),
            ),
            GetPage(
              name: '/HistoryScreen',
              page: (() => HistoryScreen()),
            ),
            GetPage(
              name: '/TrainerHistoryScreen',
              page: (() => TrainerHistoryScreen()),
            ),
            GetPage(
              name: '/MyRoutineScreen',
              page: (() => MyRoutineScreen()),
            ),
            GetPage(
              name: '/Routine1Screen',
              page: (() => Routine1Screen()),
            ),
            // should delted this calss
            GetPage(
              name: '/DateGet',
              page: (() => DateGet()),
            ),
            GetPage(
              name: '/TrainerDietPlan1Screen',
              page: (() => TrainerDietPlan1Screen()),
            ),
            GetPage(
              name: '/nav',
              page: (() => CustomBottomNavigation()),
            ),
            GetPage(
              name: '/MessagesScreeen',
              page: (() => MessagesScreeen(
                    username: "",
                  )),
            ),
            GetPage(
              name: '/DrawerScreen',
              page: (() => DrawerScreen()),
            ),
            GetPage(
              name: '/SplashScreen',
              page: (() => SplashScreen()),
            ),
            GetPage(
              name: '/SocialLoginScreen',
              page: (() => SocialLoginScreen()),
            ),
            GetPage(
              name: '/LoginScreen',
              page: (() => LoginScreen()),
            ),
            GetPage(
              name: '/ForgotPasswordScreen',
              page: (() => ForgotPasswordScreen()),
            ),
            GetPage(
              name: '/SignupScreen',
              page: (() => SignupScreen()),
            ),
            GetPage(
              name: '/OtpScreen',
              page: (() => OtpScreen(
                    userType: 0,
                  )),
            ),
            GetPage(
              name: '/ResetPasswordScreen',
              page: (() => ResetPasswordScreen()),
            ),
            GetPage(
              name: '/CreateProfileScreen',
              page: (() => CreateProfileScreen(
                    userType: 0,
                  )),
            ),
            GetPage(
              name: '/HomeScreen',
              page: (() => HomeScreen()),
            ),
            GetPage(
              name: '/NotificationsScreen',
              page: (() => NotificationsScreen()),
            ),
            GetPage(
              name: '/TrainerProfileScreen',
              page: (() => TrainerProfileScreen()),
            ),
            GetPage(
              name: '/SettingsScreen',
              page: (() => SettingsScreen()),
            ),
            GetPage(
              name: '/MyProfileScreen',
              page: (() => MyProfileScreen()),
            ),
            GetPage(
              name: '/PrivacyPolicyScreen',
              page: (() => PrivacyPolicyScreen()),
            ),
            GetPage(
              name: '/TermsAndConditionsScreen',
              page: (() => TermsAndConditionsScreen()),
            ),
            GetPage(
              name: '/ChangePasswordScreen',
              page: (() => ChangePasswordScreen()),
            ),
            GetPage(
              name: '/ChatScreen',
              page: (() => ChatScreen()),
            ),
            GetPage(
              name: '/EditMyProfileScreen',
              page: (() => EditMyProfileScreen(
                    certificatesPaths: [],
                  )),
            ),
            GetPage(
              name: '/SubscriptionScreen',
              page: (() => SubscriptionScreen()),
            ),
            GetPage(
              name: '/CreateNewPostScreen',
              page: (() => CreateNewPostScreen()),
            ),
            GetPage(
              name: '/PostLike',
              page: (() => PostLikes(
                    postid: "1",
                  )),
            ),

            GetPage(
              name: '/RoutineScreen',
              page: (() => RoutineScreen()),
            ),
            GetPage(
              name: '/LastExampleScreen',
              page: (() => LastExampleScreen()),
            ),
            GetPage(
              name: '/RequestFollower',
              page: (() => RequestFollower()),
            ),
            GetPage(
              name: '/DietPlanDays',
              page: (() => DietPlanDays()),
            ),
            GetPage(
              name: '/NutritionalTrackingScreen',
              page: (() => NutritionalTrackingScreen()),
            ),
            GetPage(
              name: '/Routine19Screen',
              page: (() => Routine19Screen()),
            ),
            GetPage(
              name: '/CustomerRequestsScreen',
              page: (() => CustomerRequestsScreen()),
            ),
            GetPage(
              name: '/NavigateScreen',
              page: (() => CustomBottomNavigation()),
            ),
            GetPage(
              name: '/SearchScreen',
              page: (() => SearchScreen()),
            ),
            GetPage(
              name: '/UserSelectionScreen',
              page: (() => UserSelectionScreen()),
            ),
          ],
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: grey
          // image: DecorationImage(
          //   image: AssetImage(
          //     'assets/Slicing/Android/drawable-hdpi/logo-5.png',
          //   ),
          //   fit: BoxFit.cover,
          // ),
          ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
  width: double.infinity,
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 72.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Padding(
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
        ),
        SizedBox(height: 120),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Video Box",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 200, 203, 203),
              ),
            ),
            SizedBox(height:MediaQuery.of(context).size.height*0.4),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Doppelgänger",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 3, 67, 76),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
),

      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
