
import 'dart:async';

import 'package:algorthimi/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';
import 'language_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final authController = Get.put(SplashController());
  final findAuth = Get
      .find<SplashController>();
  @override
  void initState() {
    super.initState();
    authController.getIsFirst();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 100.h,
          width: 100.h,
          color: accentColor,
          child: Center(
            child: Image.asset('assets/svg/splash.png', width: 28.2.h, height: 30.7.h),
          )),
    );
  }
}
