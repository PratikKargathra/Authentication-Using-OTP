import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memewala/pages/HomeView/Homepage.dart';
import 'package:memewala/pages/OtpView/OtpView.dart';
import 'package:memewala/pages/OtpView/VerifyOTP.dart';
import 'package:memewala/pages/SplashView/Splash-Screen-1.dart';

import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      initialRoute: "splash-view",
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context)=> const Homepage(),
        "splash-view":(context) => const SplashScreen1(),
        "otp-view":(context) => const OtpView(),
        "otp-verify":(context) => const OTPVerification(),
      },
    );
  }
}
