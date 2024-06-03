import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_deleviery_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:food_deleviery_app/screens/home_screen.dart';
import 'package:food_deleviery_app/screens/onboarding_screen.dart';
import 'package:food_deleviery_app/screens/wallet_screen.dart';
import 'package:food_deleviery_app/widgets/app_constants.dart';
import 'admin/add_food.dart';
import 'admin/admin_home_screen.dart';
import 'admin/admin_login.dart';
import 'auth/login_screen.dart';
import 'auth/sign_up_screen.dart';
import 'custom_widgets/bottom_nav_bar.dart';



void main() async {
  // add firebase in app
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey  = publishableKey;
  await Firebase.initializeApp();
  runApp(
      MultiBlocProvider(
        providers:  [
          BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        ],
        child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}


