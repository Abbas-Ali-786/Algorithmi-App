import 'dart:async';

import 'package:algorthimi/controller/splash_controller.dart';
import 'package:algorthimi/utils/color_data.dart';
import 'package:algorthimi/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../AuthScreens/login_screen.dart';
import '../Widgets/widget_utils.dart';

var language = 'Select your preferred language'.obs;

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final authController = Get.put(SplashController());
  final findAuth = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (context) {
      return Scaffold(
        backgroundColor: accentColor,
        body: Container(
          height: 100.h,
          width: 100.h,
          margin: EdgeInsets.symmetric(horizontal: 3.h, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              getVerSpace(8.h),
              Align(
                  alignment: Alignment.center,
                  child: getSvgImage('app_logo.svg', height: 12.h)),
              getVerSpace(1.h),
              getCustomTextW6S22(text: 'ALGORITHMI', color: textWhiteColor),
              getVerSpace(5.h),
              GestureDetector(
                onTap: () {
                  authController.isOpenLanguage.value =
                      !authController.isOpenLanguage.value;
                  authController.update();
                  print(
                      'auth controller lanaguage open value is ${authController.isOpenLanguage.value}');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      border: Border.all(color: backgroundColor, width: 1.px),
                      borderRadius: BorderRadius.all(Radius.circular(10.px))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getCustomTextW6S15(
                        text: language.toString().tr,
                        color: textBlackColor,
                      ),
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        color: textBlackColor,
                      )
                    ],
                  ),
                ),
              ),
              getVerSpace(1.h),
              authController.isOpenLanguage.value
                  ? Flexible(
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.5.h, vertical: 1.h),
                          decoration: BoxDecoration(
                              color: backgroundColor,
                              border: Border.all(
                                  color: backgroundColor, width: 1.px),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.px))),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: DataFile.languageList.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  print('ontap language button');
                                  authController.selectedLanguage.value = index;

                                  if (DataFile.languageList[index].name
                                          .toString() ==
                                      'English') {
                                    Get.updateLocale(const Locale('en', 'US'));
                                  } else if (DataFile.languageList[index].name
                                          .toString() ==
                                      'اردو') {
                                    Get.updateLocale(const Locale('ur', 'PK'));
                                  } else if (DataFile.languageList[index].name
                                          .toString() ==
                                      'عربي') {
                                    Get.updateLocale(const Locale('ar', 'SA'));
                                  } else if (DataFile.languageList[index].name
                                          .toString() ==
                                      'Français') {
                                    Get.updateLocale(const Locale('fr', 'FR'));
                                  } else if (DataFile.languageList[index].name
                                          .toString() ==
                                      'Deutsch') {
                                    Get.updateLocale(const Locale('de', 'DE'));
                                  } else if (DataFile.languageList[index].name
                                          .toString() ==
                                      'हिंदी') {
                                    Get.updateLocale(const Locale('hi', 'IN'));
                                  } else if (DataFile.languageList[index].name
                                          .toString() ==
                                      'മലയാളം') {
                                    Get.updateLocale(const Locale('ml', 'IN'));
                                  } else if (DataFile.languageList[index].name
                                          .toString() ==
                                      'नेपाली') {
                                    Get.updateLocale(const Locale('ne', 'IN'));
                                  } else if (DataFile.languageList[index].name
                                          .toString() ==
                                      'বাংলা') {
                                    Get.updateLocale(const Locale('bn', 'BD'));
                                  }

                                  language.value = DataFile
                                      .languageList[index].name
                                      .toString();

                                  Timer(const Duration(milliseconds: 100), () {
                                    Get.to(() => const LoginScreen());
                                  });
                                },
                                child: Container(
                                  color: backgroundColor,
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 1.8.h,
                                        height: 1.8.h,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: authController
                                                            .selectedLanguage
                                                            .value ==
                                                        index
                                                    ? pinkAppColor
                                                    : borderColor,
                                                width: authController
                                                            .selectedLanguage
                                                            .value ==
                                                        index
                                                    ? 4.px
                                                    : 1.5.px)),
                                      ),
                                      getHorSpace(1.2.h),
                                      getCustomTextW6S15(
                                        text: DataFile.languageList[index].name
                                            .toString()
                                            .tr,
                                        color: textBlackColor,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )),
                    )
                  : Container()
            ],
          ),
        ),
      );
    });
  }
}
