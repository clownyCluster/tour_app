import 'dart:ffi';

import 'package:tour_destiny/utils/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_constant.dart';

class ThemeContainer extends StatelessWidget {
  double? height;
  double? width;

  double? borderWidth;
  EdgeInsetsGeometry? padding;
  BorderRadiusGeometry? borderRadius;
  double? blurRadius;
  double? spreadRadius;
  Widget? child;
  Color? boxShadowLightColor;
  Color? boxShadowDarkColor;
  List<BoxShadow>? boxShadow;

  ThemeContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.blurRadius,
    this.child,
    this.borderWidth,
    this.borderRadius,
    this.boxShadowLightColor,
    this.boxShadowDarkColor,
    this.spreadRadius,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = AppConstants().appTheme;

    return Container(
      padding: padding ?? kPadding(),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: isDarkTheme ? whiteColor : darkGrey,
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          border: Border.all(
            width: borderWidth ?? 0,
            color: isDarkTheme ? blackColor : whiteColor,
          ),
          boxShadow: boxShadow ??
              [
                BoxShadow(
                    blurRadius: blurRadius ?? 0,
                    color: isDarkTheme
                        ? boxShadowLightColor ?? whiteColor.withOpacity(0.2)
                        : boxShadowDarkColor ?? blackColor.withOpacity(0.2),
                    offset: Offset(2, 2),
                    spreadRadius: spreadRadius ?? 0),
              ]),
      child: child ?? Container(),
    );
  }
}
