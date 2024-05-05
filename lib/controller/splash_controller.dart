import 'dart:async';

import 'package:algorthimi/routes/app-routes.dart';
import 'package:algorthimi/view/SplashLanguageScreens/language_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  var isOpenLanguage = false.obs;
  var selectedLanguage = 10001.obs;

  getIsFirst() async {
    // bool isIntro = await PrefData.getIsIntro();
    // bool isSignIn = await PrefData.getIsSignIn();
    //
    // if (isIntro) {
    //   Constant.sendToNext(context, Routes.introScreenRoute);
    // } else if (!isSignIn) {
    //   Constant.sendToNext(context, Routes.loginScreenRoute);
    // } else {
    //   Timer(const Duration(seconds: 3), () {
    //     Constant.sendToNext(context, Routes.homeScreenRoute);
    //   });
    // }
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.LANGUAGE);
      // Get.offAll(()=> const LanguageScreen());
    });
  }

}