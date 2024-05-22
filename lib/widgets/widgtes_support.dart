import 'dart:ui';

import 'package:flutter/material.dart';

class AppWidgets{

  //  bold text style
  static TextStyle boldTextStyle(){
    return const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }
//   heading text
  static TextStyle headlineTextStyle(){
    return const TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }

  // light text
  static TextStyle lightTextStyle(){
    return const TextStyle(
      fontSize: 15,
      color: Colors.black54,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }

//   semi bold
  static TextStyle semiBoldTextStyle(){
    return const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }



}