import 'dart:async';



import 'package:flutter/material.dart';
import 'package:food_deleviery_app/auth/login_screen.dart';
import 'package:food_deleviery_app/custom_widgets/bottom_nav_bar.dart';
import 'package:food_deleviery_app/images/images.dart';
import 'package:food_deleviery_app/screens/home_screen.dart';
import 'package:food_deleviery_app/screens/onboarding_screen.dart';
import 'package:food_deleviery_app/shared_preferences/shared_pref.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    _checkLoginStatus();

  }

  void _checkLoginStatus() async {
    bool isLoggedIn = await SharedPreferenceHelper.getLoginStatus();
    Timer(const Duration(seconds: 5), () {
      if (isLoggedIn) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const BottomNavBar()));

      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>  const OnboardScreen()));

      }
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
              height: double.infinity,
              child: Image.asset(AppImages.screenOneImage,fit: BoxFit.fill,))
        ),
      ),

    );
  }
}
