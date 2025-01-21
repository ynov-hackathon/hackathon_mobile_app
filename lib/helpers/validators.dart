import 'dart:core';

class Validators {
  Validators._(); // private constructor to avoid external instantiation

  static final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static final RegExp passwordRegExp = RegExp(r'^.{8,}$');

  static String? Function(String?) emailValidator({
    required String emptyErrorMsg,
    required String invalidFormatMsg
  })
  {
    return regExpMatchValidator(regExp: emailRegExp, emptyErrorMsg: emptyErrorMsg, invalidFormatMsg: invalidFormatMsg);
  }

  static String? Function(String?) passwordValidator({
    required String emptyErrorMsg,
    required String invalidFormatMsg
  }) {
    return regExpMatchValidator(regExp: passwordRegExp, emptyErrorMsg: emptyErrorMsg, invalidFormatMsg: invalidFormatMsg);
  }

  static String? Function(String?) regExpMatchValidator({required RegExp regExp, required String emptyErrorMsg, required String invalidFormatMsg}) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return emptyErrorMsg;
      } else if (!regExp.hasMatch(value)) {
        return invalidFormatMsg;
      }
      return null; // Valid name
    };
  }
}