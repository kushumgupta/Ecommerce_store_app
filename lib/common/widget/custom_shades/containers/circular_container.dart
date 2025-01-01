import 'package:e_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ECircularContainer extends StatelessWidget {
  const ECircularContainer({
    super.key,
    this.child,
    this.height  = 400,
    this.width = 400,
    this.radius = 400,
    this.margin,
    this.padding = 0,
    this.backgroundColor = EColors.white,

  });
  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
