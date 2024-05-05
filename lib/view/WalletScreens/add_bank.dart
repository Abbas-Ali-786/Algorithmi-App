import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';
import 'opt_screen.dart';

//ignore: must_be_immutable
class AddBankScreen extends StatefulWidget {
  AddBankScreen({Key? key, this.selectedMethod, this.selectedBank})
      : super(key: key);
  dynamic selectedMethod;
  dynamic selectedBank;

  @override
  State<AddBankScreen> createState() => _AddBankScreenState();
}

class _AddBankScreenState extends State<AddBankScreen> {
  TextEditingController accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 100.h,
        child: Column(
          children: [
            Container(
              height: 20.h,
              padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 2.h),
              decoration: BoxDecoration(color: accentColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getVerSpace(2.h),
                  Row(
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
                        text: widget.selectedMethod.toString(),
                        color: textWhiteColor,
                      ),
                      const Spacer()
                    ],
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.px)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 2.h),
                          leading: CircleAvatar(
                              radius: 2.5.h, backgroundColor: borderColor),
                          title: getCustomTextW6S15(
                              text: widget.selectedBank.toString().tr,
                              color: textBlackColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getVerSpace(3.h),
                  getCustomTextW6S15(
                      text: widget.selectedMethod == 'E-Wallet'.tr
                          ? 'Account Number'.tr
                          : 'Account Number/IBAN'.tr,
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
                        ]),
                    child: getCustomTextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      hintText: widget.selectedMethod == 'E-Wallet'.tr
                          ? 'Account Number'.tr
                          : 'Account Number/IBAN'.tr,
                      controller: accountNumberController,
                      onChanged: (value) {},
                    ),
                  ),
                  getVerSpace(0.5.h),
                  getCustomTextW6S10(
                      text: widget.selectedMethod == 'E-Wallet'.tr
                          ? '${'Please enter'.tr} ${widget.selectedBank.toString().tr} ${'11 digit account number'.tr}'
                          : '${'Please enter'.tr} ${widget.selectedBank.toString().tr} ${'11 digit account number'.tr}',
                      color: subTextColor),
                  getVerSpace(5.h),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => OTPScreen(
                              selectedMethod: widget.selectedMethod,
                            ));
                      },
                      child:
                          fillColorButton(text: 'Add'.tr, color: pinkAppColor)),
                  getVerSpace(1.5.h),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.back();
                        Get.back();
                      },
                      child: outlineButton(
                          text: 'Cancel'.tr,
                          color: backgroundColor,
                          borderColor: pinkAppColor))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
