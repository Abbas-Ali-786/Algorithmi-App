import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';

//ignore: must_be_immutable
class AddCard extends StatefulWidget {
  AddCard({Key? key, this.selectedMethod}) : super(key: key);
  dynamic selectedMethod;

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController dateNumberController = TextEditingController();
  TextEditingController ccvNumberController = TextEditingController();
  TextEditingController nameNumberController = TextEditingController();

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
        body: SizedBox(
          width: 100.h,
          child: Column(
            children: [
              Container(
                width: 100.w,
                height: 15.h,
                padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.h),
                decoration: BoxDecoration(color: accentColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getVerSpace(2.h),
                    getCustomTextW6S22(
                      text: widget.selectedMethod.toString(),
                      color: textWhiteColor,
                    ),
                  ],
                ),
              ),
              getVerSpace(3.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomTextW6S15(
                            text: 'Card Number'.tr, color: accentColor),
                        getVerSpace(1.h),
                        Container(
                          decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.all(Radius.circular(15.px)),
                            boxShadow: [
                              BoxShadow(
                                color: borderColor,
                                blurRadius: 10,
                                offset: const Offset(
                                    0, 0), // changes position of shadow
                              ),
                            ],),
                          child: getCustomTextFormField(
                            keyboardType: TextInputType.phone,
                            obscureText: false,
                            hintText: 'Enter 16 digit card no'.tr,
                            controller: cardNumberController,
                            onChanged: (value) {},
                          ),
                        ),
                        getVerSpace(2.h),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getCustomTextW6S15(
                                      text: 'Expiry Date'.tr,
                                      color: accentColor),
                                  getVerSpace(1.h),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: backgroundColor,
                                      borderRadius: BorderRadius.all(Radius.circular(15.px)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: borderColor,
                                          blurRadius: 10,
                                          offset: const Offset(
                                              0, 0), // changes position of shadow
                                        ),
                                      ],),
                                    child: getCustomTextFormField(
                                      keyboardType: TextInputType.phone,
                                      obscureText: false,
                                      hintText: '00/00',
                                      controller: dateNumberController,
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            getHorSpace(1.h),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getCustomTextW6S15(
                                      text: 'CCV'.tr, color: accentColor),
                                  getVerSpace(1.h),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: backgroundColor,
                                      borderRadius: BorderRadius.all(Radius.circular(15.px)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: borderColor,
                                          blurRadius: 10,
                                          offset: const Offset(
                                              0, 0), // changes position of shadow
                                        ),
                                      ],),
                                    child: getCustomTextFormField(
                                      keyboardType: TextInputType.phone,
                                      obscureText: false,
                                      hintText: '000',
                                      controller: ccvNumberController,
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        getVerSpace(2.h),
                        getCustomTextW6S15(
                            text: 'Client'.tr, color: accentColor),
                        getVerSpace(1.h),
                        Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(15.px)),
                            boxShadow: [
                              BoxShadow(
                                color: borderColor,
                                blurRadius: 10,
                                offset: const Offset(
                                    0, 0), // changes position of shadow
                              ),
                            ],),
                          child: getCustomTextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            hintText: 'Enter Your Name'.tr,
                            controller: nameNumberController,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                    getVerSpace(5.h),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              // Get.to(() => OTPScreen(
                              //       isAddBankConfirm: true,
                              //       selectedMethod: widget.selectedMethod,
                              //     ));
                            },
                            child: fillColorButton(
                                text: 'Add'.tr, color: pinkAppColor)),
                        getVerSpace(1.5.h),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                              Get.back();
                            },
                            child: outlineButton(
                                text: 'Cancel'.tr,
                                color: backgroundColor,
                                borderColor: pinkAppColor))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
