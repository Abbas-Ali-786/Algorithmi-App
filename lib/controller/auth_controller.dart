
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isShowPassword = true.obs;
  var isCheck = false.obs;
  var isSigningIn = false.obs;
  var isSelectSignUp = 100.obs;




}