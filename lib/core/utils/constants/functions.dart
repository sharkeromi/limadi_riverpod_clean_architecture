// Functions will be written here
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/common_model/error_model.dart';
import 'package:limadi_riverpod_clean_architecture/core/utils/constants/const.dart';

void showToaster(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

ErrorModel exceptionCatcher(exception){
  Error error = Error(fieldName: "Error", message: exception);
  ErrorModel errorModel = ErrorModel(errors: [error]);
  return errorModel;
}

bool isDeviceScreenLarge() {
  if (height > kSmallDeviceSizeLimit) {
    return true;
  } else {
    return false;
  }
}

void heightWidthKeyboardValue(context) {
  height = MediaQuery.of(context).size.height;
  width = MediaQuery.of(context).size.width;
  keyboardValue = MediaQuery.of(context).viewInsets.bottom;
}