import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../BottomNavBar/bottom_nav_bar_freelancer_screen.dart';
import '../Widgets/widget_utils.dart';

class WithdrawPaymentVerificationScreen extends StatefulWidget {
  const WithdrawPaymentVerificationScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawPaymentVerificationScreen> createState() =>
      _WithdrawPaymentVerificationScreenState();
}

class _WithdrawPaymentVerificationScreenState
    extends State<WithdrawPaymentVerificationScreen> {
  TextEditingController phoneVerificationController = TextEditingController();
  TextEditingController emailVerificationController = TextEditingController();
  TextEditingController googleVerificationController = TextEditingController();

  back() {
    Get.back();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: SizedBox(
          height: 100.h,
          width: 100.h,
          child: Stack(
            children: [
              Container(
                height: 20.h,
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
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios_new_outlined,
                          color: backgroundColor, size: 2.5.h),
                    ),
                    const Spacer(),
                    getCustomTextW6S22(
                      text: 'Verification',
                      color: textWhiteColor,
                    ),
                    const Spacer()
                  ],
                ),
              ),
              Positioned(
                top: 15.h,
                right: 0,
                left: 0,
                child: Container(
                  width: 100.h,
                  height: 100.h - 20.h,
                  padding: EdgeInsets.only(top: 3.h, left: 2.h, right: 2.h),
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric(horizontal: 3.h),
                  decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.px))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCustomTextW6S12(
                              text:
                                  'Mobile code has been send to +971 55 ********',
                              color: subTextColor),
                          getVerSpace(1.h),
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
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              hintText: 'Mobile verification code'.tr,
                              suffixIcon: getCustomTextW6S15(
                                  text: 'Send Code', color: pinkAppColor),
                              suffixIconConstraintsWidth: 12.h,
                              controller: phoneVerificationController,
                              onChanged: (value) {},
                            ),
                          ),
                          getVerSpace(2.h),
                          getCustomTextW6S12(
                              text:
                                  'Email code will be sent to 123**@*****.com',
                              color: subTextColor),
                          getVerSpace(1.h),
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
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              hintText: 'Email verification code '.tr,
                              suffixIcon: getCustomTextW6S15(
                                  text: 'Send Code', color: pinkAppColor),
                              suffixIconConstraintsWidth: 12.h,
                              controller: emailVerificationController,
                              onChanged: (value) {},
                            ),
                          ),
                          getVerSpace(2.h),
                          getCustomTextW6S12(
                              text: 'Google verification code',
                              color: subTextColor),
                          getVerSpace(1.h),
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
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              hintText: 'Google verification code'.tr,
                              suffixIcon: getCustomTextW6S15(
                                  text: 'Send Code', color: pinkAppColor),
                              suffixIconConstraintsWidth: 12.h,
                              controller: googleVerificationController,
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const BottomNavBarFreelancerScreen());
                            },
                            child: fillColorButton(
                                color: pinkAppColor, text: 'Submit'),
                          ),
                          getVerSpace(1.5.h),
                          getCustomTextW6S12(
                              text: 'Security verification unavailable?',
                              color: subTextColor)
                        ],
                      ),
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
