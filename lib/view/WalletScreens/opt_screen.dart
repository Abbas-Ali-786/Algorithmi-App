import 'dart:async';
import 'dart:developer';

import 'package:algorthimi/view/AuthScreens/Widgets/welldone_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';

//ignore: must_be_immutable
class OTPScreen extends StatefulWidget {
  OTPScreen({Key? key, this.selectedMethod}) : super(key: key);
  dynamic selectedMethod;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

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
                    text: 'Enter Verification\nCode'.tr,
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
                          text: 'Please enter the OTP Code\nwe sent you'.tr,
                          color: textBlackColor,
                          textAlign: TextAlign.center),
                    ),
                    getVerSpace(4.h),
                    PinCodeTextField(
                      length: 4,
                      keyboardType: TextInputType.phone,
                      appContext: context,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                          borderWidth: 1.px,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          selectedColor: pinkAppColor,
                          selectedFillColor: backgroundColor,
                          inactiveColor: subTextColor,
                          inactiveFillColor: backgroundColor,
                          fieldHeight: 5.5.h,
                          fieldWidth: 4.h,
                          activeColor: pinkAppColor,
                          activeFillColor: backgroundColor,
                          fieldOuterPadding:
                              EdgeInsets.symmetric(horizontal: 1.1.h)),
                      animationDuration: const Duration(milliseconds: 200),
                      backgroundColor: backgroundColor,
                      mainAxisAlignment: MainAxisAlignment.center,
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: otpController,
                      onCompleted: (v) {
                        Get.to(() => WellDoneScreen(
                              screenTitle: 'addBank',
                              selectedMethod: widget.selectedMethod,
                            ));
                        log("Completed\n OTP:${otpController.text}");
                      },
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        log("Allowing to paste $text");
                        return true;
                      },
                    ),
                    getVerSpace(2.h),
                    getCustomTextW6S15(
                        text: "I did not receive the OTP".tr,
                        color: subTextColor),
                    getVerSpace(1.8.h),
                    getCustomTextW6S15(
                        text: "Resend Code".tr, color: pinkAppColor),
                    getVerSpace(2.h),
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
