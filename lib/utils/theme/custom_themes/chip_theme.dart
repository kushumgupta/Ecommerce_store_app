import 'package:e_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class EChipTheme{
  EChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: EColors.primary,
    padding:const  EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
    checkmarkColor: Colors.white
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
      disabledColor: EColors.darkerGrey,
      labelStyle: TextStyle(color: Colors.white),
      selectedColor: EColors.primary,
      padding:EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      checkmarkColor: Colors.white
  );
}