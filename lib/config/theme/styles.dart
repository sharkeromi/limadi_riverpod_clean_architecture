// Text style, 
import 'package:flutter/material.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/constants/const.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/constants/functions.dart';


dynamic screenWiseSize(size, difference) {
  return isDeviceScreenLarge() ? size : size - difference;
}

TextStyle medium24TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w500, fontSize: screenWiseSize(h24, 2), color: color);
}

TextStyle medium12TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w500, fontSize: screenWiseSize(h12, 2), color: color);
}

TextStyle medium14TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w500, fontSize: screenWiseSize(h14, 2), color: color);
}

TextStyle medium16TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w500, fontSize: screenWiseSize(h16, 2), color: color);
}

TextStyle regular20TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w400, fontSize: screenWiseSize(h20, 2), color: color);
}

TextStyle regular18TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w400, fontSize: screenWiseSize(h18, 2), color: color);
}

TextStyle regular16TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w400, fontSize: screenWiseSize(h16, 2), color: color);
}

TextStyle regular14TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w400, fontSize: screenWiseSize(h14, 2), color: color);
}

TextStyle regular12TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w400, fontSize: screenWiseSize(h12, 2), color: color);
}

TextStyle regular10TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w400, fontSize: screenWiseSize(h10, 0), color: color);
}

TextStyle regular8TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w400, fontSize: screenWiseSize(h8, 0), color: color);
}

TextStyle semiBold24TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w600, fontSize: screenWiseSize(h24, 2), color: color);
}

TextStyle semiBold20TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w600, fontSize: screenWiseSize(h20, 2), color: color);
}

TextStyle semiBold18TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w600, fontSize: screenWiseSize(h18, 2), color: color);
}

TextStyle semiBold16TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w600, fontSize: screenWiseSize(h16, 2), color: color);
}

TextStyle semiBold14TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w600, fontSize: screenWiseSize(h14, 2), color: color);
}

TextStyle semiBold12TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w600, fontSize: screenWiseSize(h12, 2), color: color);
}

TextStyle semiBold10TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w600, fontSize: screenWiseSize(h10, 0), color: color);
}

TextStyle semiBold8TextStyle(Color color) {
  return TextStyle(fontWeight: FontWeight.w600, fontSize: screenWiseSize(h8, 0), color: color);
}

ButtonStyle? kTextButtonStyle = TextButton.styleFrom(
  padding: EdgeInsets.zero,
  minimumSize: Size.zero,
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  splashFactory: InkSplash.splashFactory,
);