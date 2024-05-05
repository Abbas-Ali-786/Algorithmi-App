import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SizedBox(
        width: 100.w,
        child: Column(
          children: [
            SizedBox(
              width: 100.h,
              child: Stack(
                children: [
                  Container(
                    height: 20.h,
                    width: 100.w,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 3.h, right: 3.h),
                    decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(4.h))),
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
                          text: 'Profile'.tr,
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
                      height: 5.h,
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.h),
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.symmetric(horizontal: 3.h),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.px),
                            topLeft: Radius.circular(10.px)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            getVerSpace(1.h),
            Expanded(
              child: SizedBox(
                width: 100.w,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomTextW6S16(
                            text: 'Personal Information'.tr,
                            color: accentColor),
                        getVerSpace(2.h),
                        personalInfoCard(
                          title: 'Full Name'.tr,
                          subTitle: 'Muhammad Usman'.tr,
                        ),
                        getVerSpace(1.5.h),
                        personalInfoCard(
                          title: 'ID Number'.tr,
                          subTitle: '000-0000000-00-0'.tr,
                        ),
                        getVerSpace(1.5.h),
                        personalInfoCard(
                          title: 'Nationality'.tr,
                          subTitle: 'United Arab Emirates'.tr,
                        ),
                        getVerSpace(1.5.h),
                        personalInfoCard(
                          title: 'Gender'.tr,
                          subTitle: 'Male'.tr,
                        ),
                        getVerSpace(1.5.h),
                        personalInfoCard(
                          title: 'Card Number'.tr,
                          subTitle: '1234567890'.tr,
                        ),
                        getVerSpace(1.5.h),
                        personalInfoCard(
                          title: 'Date Of Birth'.tr,
                          subTitle: '12-03-1996'.tr,
                        ),
                        getVerSpace(1.5.h),
                        personalInfoCard(
                          title: 'Expiry Date'.tr,
                          subTitle: '12-03-2025'.tr,
                        ),
                        getVerSpace(1.5.h),
                        getVerSpace(4.h),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
