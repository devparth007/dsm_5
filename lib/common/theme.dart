import 'package:flutter/material.dart';

class AppTheme {
  static Color mainColor = const Color(0xff7950B7);
  static Color purpleColor = const Color(0xffE2CEFF);
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black;
  static Color lightMainColor = const Color(0xffF3EBFF);
  static Color lightBlueColor = const Color(0xffE5FFFF);
  static Color blueColor = const Color(0xff1FD8E3);
  static Color lightBrownColor = const Color(0xffFFE7DF);
  static Color brownColor = const Color(0xff9F5238);
  static Color greenColor = const Color(0xff00BB64);
  static Color redColor = const Color(0xffff5062);
  static Color orangeColor = const Color(0xffFFE0D1);
  static Color lightOrangeColor = const Color(0xffFFEFE7);
  static Color lightGreenColor = const Color(0xffE5FFE9);
  static Color greenRingColor = const Color(0xff52C964);
  static Color darkBlueColor = const Color(0xff49A4FF);
  static Color darkOrangeColor = const Color(0xffFF9562);

//
//=========================== 13 ===============================================

  static TextStyle black13w500 =
      TextStyle(color: blackColor, fontSize: 13, fontWeight: FontWeight.w500);

//========================== 14 ================================================

  static TextStyle black14w600 =
      TextStyle(color: blackColor, fontSize: 14, fontWeight: FontWeight.w600);

  static TextStyle grey14w500 = TextStyle(
      color: Colors.grey.withOpacity(0.5),
      fontSize: 14,
      fontWeight: FontWeight.w400);

  static TextStyle black14w400 =
      TextStyle(color: blackColor, fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle white14w600 =
      TextStyle(color: whiteColor, fontSize: 14, fontWeight: FontWeight.w600);

  static TextStyle main14w600 =
      TextStyle(color: mainColor, fontSize: 14, fontWeight: FontWeight.w600);

  static TextStyle main14w400 =
      TextStyle(color: mainColor, fontSize: 14, fontWeight: FontWeight.w400);

//========================== 16 ================================================

  static TextStyle main16w600 =
      TextStyle(color: mainColor, fontSize: 16, fontWeight: FontWeight.w600);

  static TextStyle black16w600 =
      TextStyle(color: blackColor, fontSize: 16, fontWeight: FontWeight.w600);

  static TextStyle brown16w600 =
      TextStyle(color: brownColor, fontSize: 16, fontWeight: FontWeight.w600);

  static TextStyle mainColor16w600 =
      TextStyle(color: mainColor, fontSize: 16, fontWeight: FontWeight.w600);

  static TextStyle black16w400 =
      TextStyle(color: blackColor, fontSize: 16, fontWeight: FontWeight.w400);

  static TextStyle red16w400 =
      TextStyle(color: redColor, fontSize: 16, fontWeight: FontWeight.w400);

  static TextStyle black16w300 =
      TextStyle(color: blackColor, fontSize: 16, fontWeight: FontWeight.w300);

//=========================== 18 ===============================================

  static TextStyle black18w600 =
      TextStyle(color: blackColor, fontSize: 18, fontWeight: FontWeight.w600);

//========================== 20 ================================================

  static TextStyle black20w600 =
      TextStyle(color: blackColor, fontSize: 20, fontWeight: FontWeight.w600);

  static TextStyle black20w300 =
      TextStyle(color: blackColor, fontSize: 20, fontWeight: FontWeight.w300);

  static TextStyle white20w600 =
      TextStyle(color: whiteColor, fontSize: 20, fontWeight: FontWeight.w600);

  static TextStyle main20w600 =
      TextStyle(color: mainColor, fontSize: 20, fontWeight: FontWeight.w600);

//==============================================================================

  static OutlineInputBorder textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: lightMainColor,
      ));

  static OutlineInputBorder authTextFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: mainColor,
      ));

//==============================================================================

  static ButtonStyle commonButtonStyle = ButtonStyle(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    shadowColor: MaterialStateProperty.all(mainColor),
    foregroundColor: MaterialStateProperty.all(mainColor),
    backgroundColor: MaterialStateProperty.all(mainColor),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(vertical: 15),
    ),
  );
}
