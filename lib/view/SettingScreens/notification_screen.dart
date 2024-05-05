import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var selectedPaymentMethod = 0.obs;
  back(){
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
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
                            text: 'Notifications'.tr,
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomTextW6S16(
                            text: 'Today\'s Notification'.tr, color: accentColor),
                        getVerSpace(2.h),
                        Expanded(
                          child: SizedBox(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 3,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 100.w,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.h, vertical: 1.h),
                                  margin: EdgeInsets.symmetric(vertical: 0.5.h,horizontal: 1.h),
                                  decoration: BoxDecoration(
                                    color: backgroundColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.px)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: borderColor,
                                        blurRadius: 2,
                                        offset: const Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      getCustomTextW6S15(
                                          text: 'Approved Review'.tr,
                                          color: accentColor),
                                      getVerSpace(0.5.h),
                                      getCustomTextW6S12(
                                          text: 'Your Given Review about Shop is approved from Admin.'.tr,
                                          color: subTextColor),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        getVerSpace(4.h),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
