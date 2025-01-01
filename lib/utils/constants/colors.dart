import 'package:flutter/material.dart';

class  EColors{

  EColors._();

  // App Basic Colors

  static const Color primary = Color(0xd8904bff);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent =Color(0xfdb199cc);

  // gradient colors

  static const  Gradient linerGradient = LinearGradient(
   begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors:[
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // background container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = EColors.white.withOpacity(0.1);

  //Button Colors
  static const Color buttonPrimary= Color(0xfda27fc8);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisable = Color(0xFF6C757D);

  // border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

   // error and validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

   // neutral shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGray = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);



}