import 'package:algorthimi/view/AuthScreens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';

class ForgotPasswordConfirmedScreen extends StatefulWidget {
  const ForgotPasswordConfirmedScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordConfirmedScreen> createState() =>
      _ForgotPasswordConfirmedScreenState();
}

class _ForgotPasswordConfirmedScreenState
    extends State<ForgotPasswordConfirmedScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  var isShowPassword = true.obs;
  var isShowPassword1 = true.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: SizedBox(
          height: 100.h,
          width: 100.h,
          child: Stack(
            children: [
              Container(
                height: 22.h,
                width: 100.w,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 6.h, left: 3.h, right: 3.h),
                decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(4.h))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios_new_outlined,
                          color: backgroundColor, size: 2.5.h),
                    ),
                    const Spacer(),
                    getCustomTextW6S22(
                      text: 'Reset Password'.tr,
                      color: textWhiteColor,
                    ),
                    const Spacer()
                  ],
                ),
              ),
              Positioned(
                top: 16.h,
                right: 0,
                left: 0,
                child: Container(
                  width: 100.h,
                  height: 100.h,
                  padding: EdgeInsets.only(top: 2.h),
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric(horizontal: 3.h),
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.px))),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.h),
                        child: getCustomTextW6S15(
                            text:
                                'Your new password must be different from previous used passwords.'.tr,
                            color: textBlackColor,
                            textAlign: TextAlign.center),
                      ),
                      getVerSpace(10.h),
                      Container(
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.px)),
                            boxShadow: [
                              BoxShadow(
                                color: borderColor,
                                blurRadius: 10,
                                offset: const Offset(
                                    0, 0), // changes position of shadow
                              ),
                            ]),
                        child: getCustomTextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isShowPassword.value,
                          controller: passwordController,
                          hintText: 'Password'.tr,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password not be empty!".tr;
                            } else if (value.length <= 4) {
                              return "Password must be greater than 5 character!"
                                  .tr;
                            } else {
                              return null;
                            }
                          },
                          suffixIcon: GestureDetector(
                              onTap: () {
                                isShowPassword.value = !isShowPassword.value;
                              },
                              child: isShowPassword.value
                                  ? Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: textBlackColor,
                                      size: 20.px,
                                    )
                                  : Icon(
                                      Icons.password,
                                      color: textBlackColor,
                                      size: 20.px,
                                    )),
                        ),
                      ),
                      getVerSpace(2.h),
                      Container(
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.px)),
                            boxShadow: [
                              BoxShadow(
                                color: borderColor,
                                blurRadius: 10,
                                offset: const Offset(
                                    0, 0), // changes position of shadow
                              ),
                            ]),
                        child: getCustomTextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: isShowPassword1.value,
                          controller: password1Controller,
                          hintText: 'Confirm Password'.tr,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password not be empty!".tr;
                            } else if (value.length <= 4) {
                              return "Password must be greater than 5 character!"
                                  .tr;
                            } else {
                              return null;
                            }
                          },
                          suffixIcon: GestureDetector(
                              onTap: () {
                                isShowPassword1.value = !isShowPassword1.value;
                              },
                              child: isShowPassword1.value
                                  ? Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: textBlackColor,
                                      size: 20.px,
                                    )
                                  : Icon(
                                      Icons.password,
                                      color: textBlackColor,
                                      size: 20.px,
                                    )),
                        ),
                      ),
                      getVerSpace(3.h),
                      GestureDetector(
                          onTap: () {
                            Get.to(() => const LoginScreen());
                          },
                          child: fillColorButton(
                              color: pinkAppColor, text: 'Reset Password'.tr)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
