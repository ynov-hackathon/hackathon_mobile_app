import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/viewmodels/base.viewmodel.dart';

class LoginViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
}