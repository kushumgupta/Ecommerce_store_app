import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class ESpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: ESizes.appBarHeight,
    left: ESizes.defaultSpace,
    bottom: ESizes.defaultSpace,
    right: ESizes.defaultSpace,
  );
}