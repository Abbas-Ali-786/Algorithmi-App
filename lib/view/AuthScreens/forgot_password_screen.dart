
import 'package:algorthimi/view/Widgets/regex-email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';
import 'forgot_password_confirmed_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    text: 'Forgot Password'.tr,
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
                              'Don’t worry! It happens. Please enter the email address associated with your account.'.tr,
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
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        hintText: 'Enter Your Email'.tr,
                        controller: emailController,
                        validator: (value) => EmailReg.isValidEmail(value)
                            ? null
                            : "Please enter a valid email".tr,
                        onChanged: (value) {},
                      ),
                    ),
                    getVerSpace(3.h),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => const ForgotPasswordConfirmedScreen());
                        },
                        child:
                        fillColorButton(color: pinkAppColor, text: 'Submit'.tr)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
