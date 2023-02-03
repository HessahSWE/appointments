import 'package:flutter/material.dart';

class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHight;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData?.size.width;
    screenHight = mediaQueryData?.size.height;
  }

  static get widthSize {
    return screenWidth;
  }

  static get hightSize {
    return screenHight;
  }

  static const spaceSmall = SizedBox(
    height: 25,
  );
  static const space = SizedBox(
    height: 10,
  );
  static SizedBox spaceMedium = SizedBox(
    height: screenHight! * 0.05,
  );
  static SizedBox spaceBig = SizedBox(
    height: screenHight! * 0.08,
  );
  static const outlinedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  static const focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.greenAccent,
      ));
  static const errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.red,
      ));
  static const primaryColor = Colors.greenAccent;
  static const greyColor = Color(0xFF616161);
}
