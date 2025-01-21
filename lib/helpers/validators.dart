import 'dart:core';

/// A utility class for validating user input using regular expressions.
/// 
/// This class provides methods to validate email addresses and passwords
/// based on predefined regular expressions. It also includes a generic method
/// for validating any input using a custom regular expression.
class Validators {
  Validators._(); // private constructor to avoid external instantiation

  /// Regular expression for validating email addresses.
  static final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  /// Regular expression for validating passwords.
  /// 
  /// This regex ensures the password is at least 8 characters long.
  static final RegExp passwordRegExp = RegExp(r'^.{8,}$');

  /// Validates an email address using the predefined email regular expression.
  /// 
  /// [emptyErrorMsg]: The error message to return if the input is empty.
  /// [invalidFormatMsg]: The error message to return if the input does not match the email format.
  /// 
  /// Returns a validator function that can be used in form fields.
  static String? Function(String?) emailValidator({
    required String emptyErrorMsg,
    required String invalidFormatMsg
  })
  {
    return regExpMatchValidator(regExp: emailRegExp, emptyErrorMsg: emptyErrorMsg, invalidFormatMsg: invalidFormatMsg);
  }

  /// Validates a password using the predefined password regular expression.
  /// 
  /// [emptyErrorMsg]: The error message to return if the input is empty.
  /// [invalidFormatMsg]: The error message to return if the input does not match the password format.
  /// 
  /// Returns a validator function that can be used in form fields
  static String? Function(String?) passwordValidator({
    required String emptyErrorMsg,
    required String invalidFormatMsg
  }) {
    return regExpMatchValidator(regExp: passwordRegExp, emptyErrorMsg: emptyErrorMsg, invalidFormatMsg: invalidFormatMsg);
  }

  /// A generic validator function that checks if the input matches a given regular expression.
  /// 
  /// [regExp]: The regular expression to validate the input against.
  /// [emptyErrorMsg]: The error message to return if the input is empty.
  /// [invalidFormatMsg]: The error message to return if the input does not match the regular expression.
  /// 
  /// Returns a validator function that can be used in form fields.
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