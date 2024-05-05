import 'package:algorthimi/view/WalletScreens/withdraw_payment_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';

class WithdrawOtherMethodScreen extends StatefulWidget {
  const WithdrawOtherMethodScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawOtherMethodScreen> createState() =>
      _WithdrawOtherMethodScreenState();
}

class _WithdrawOtherMethodScreenState extends State<WithdrawOtherMethodScreen> {
  TextEditingController coinController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController amountController = TextEditingController();

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
        body: SingleChildScrollView(
          child: SizedBox(
            height: 100.h,
            width: 100.h,
            child: Stack(
              children: [
                Container(
                  height: 16.h,
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
                        text: 'Withdraw Crypto',
                        color: textWhiteColor,
                      ),
                      const Spacer()
                    ],
                  ),
                ),
                Positioned(
                  top: 12.5.h,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: 100.h,
                    height: 100.h - 16.h,
                    padding: EdgeInsets.only(top: 1.h, left: 2.h, right: 2.h),
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.symmetric(horizontal: 3.h),
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.px))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 100.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getCustomTextW6S22(
                                      text: 'Send BTC', color: textBlackColor),
                                  getCustomTextW6S15(
                                      text: 'Send BTC to Binance account',
                                      color: subTextColor)
                                ],
                              ),
                            ),
                            getVerSpace(2.h),
                            Row(
                              children: [
                                Expanded(
                                  child: getCustomTextW6S15(
                                      text: 'Send Mode', color: textBlackColor),
                                ),
                                getHorSpace(2.h),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.px)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: borderColor,
                                            blurRadius: 10,
                                            offset: const Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ]),
                                    child: getCustomTextFormField(
                                      keyboardType: TextInputType.text,
                                      obscureText: false,
                                      hintText: 'Email'.tr,
                                      controller: coinController,
                                      suffixIcon: Icon(
                                          Icons.arrow_drop_down_rounded,
                                          color: subTextColor),
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            getVerSpace(1.5.h),
                            Row(
                              children: [
                                Expanded(
                                  child: getCustomTextW6S15(
                                      text: 'Email', color: textBlackColor),
                                ),
                                getHorSpace(2.h),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.px)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: borderColor,
                                            blurRadius: 10,
                                            offset: const Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ]),
                                    child: getCustomTextFormField(
                                      keyboardType: TextInputType.text,
                                      obscureText: false,
                                      hintText: '12354@gmail.com'.tr,
                                      controller: addressController,
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            getVerSpace(1.5.h),
                            Row(
                              children: [
                                Expanded(
                                  child: getCustomTextW6S15(
                                      text: 'Amount', color: textBlackColor),
                                ),
                                getHorSpace(2.h),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.px)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: borderColor,
                                            blurRadius: 10,
                                            offset: const Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ]),
                                    child: getCustomTextFormField(
                                      keyboardType: TextInputType.text,
                                      obscureText: false,
                                      hintText: 'Enter Amount'.tr,
                                      controller: amountController,
                                      suffixIconConstraintsWidth: 10.h,
                                      suffixIcon: getCustomTextW6S12(
                                          text: 'MAX   BTC',
                                          color: textBlackColor),
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            getVerSpace(1.5.h),
                            Container(
                              width: 100.w,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.px)),
                                  border: Border.all(
                                      color: accentColor, width: 1.px)),
                              child: Column(
                                children: [
                                  Container(
                                      height: 5.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                          color: accentColor,
                                          border: Border.all(
                                              color: accentColor, width: 1.px),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.px))),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          getCustomTextW6S15(
                                              text: 'Available',
                                              color: textWhiteColor),
                                          getCustomTextW6S15(
                                              text: '9.32 BTC',
                                              color: textWhiteColor),
                                        ],
                                      )),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 2.h, vertical: 2.h),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 1.h),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.check_circle,
                                                      color: greenColor,
                                                      size: 2.5.h),
                                                  getHorSpace(1.h),
                                                  getCustomTextW6S12(
                                                      text: 'Spot Wallet',
                                                      color: subTextColor),
                                                ],
                                              ),
                                              getCustomTextW6S12(
                                                  text: '1 BTC',
                                                  color: subTextColor)
                                            ],
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.check_circle,
                                                    color: greenColor,
                                                    size: 2.5.h),
                                                getHorSpace(1.h),
                                                getCustomTextW6S12(
                                                    text: 'Funding Wallet',
                                                    color: subTextColor),
                                              ],
                                            ),
                                            getCustomTextW6S12(
                                                text: '0 BTC',
                                                color: subTextColor)
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            getVerSpace(1.5.h),
                            SizedBox(
                              width: 100.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getCustomTextW6S15(
                                      text: 'Note (Optinal)',
                                      color: textBlackColor),
                                  getVerSpace(1.h),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.px)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: borderColor,
                                            blurRadius: 10,
                                            offset: const Offset(0,
                                                0), // changes position of shadow
                                          ),
                                        ]),
                                    child: getCustomTextFormField(
                                      keyboardType: TextInputType.text,
                                      obscureText: false,
                                      hintText:
                                          'Add a note for the recipient'.tr,
                                      controller: noteController,
                                      suffixIcon: getCustomTextW6S12(
                                          text: '0/50', color: textBlackColor),
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            getCustomTextW6S15(
                                text: 'Total Coins', color: textBlackColor),
                            getCustomTextW6S36(
                                text: '1 BTC', color: pinkAppColor),
                            getCustomTextW6S12(
                                text: 'No fees', color: subTextColor)
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              elevation: 5,
                              builder: (BuildContext context) {
                                return Container(
                                  width: 100.w,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.h, horizontal: 3.h),
                                  decoration: BoxDecoration(
                                      color: backgroundColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15.px),
                                          topRight: Radius.circular(15.px))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              getCustomTextW6S17(
                                                  text: 'Confirm Order'.tr,
                                                  color: greenColor),
                                              InkWell(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Icon(
                                                  Icons.close,
                                                  color: subTextColor,
                                                  size: 20,
                                                ),
                                              )
                                            ],
                                          ),
                                          getVerSpace(2.h),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              getCustomTextW6S15(
                                                  text: 'Total Coins',
                                                  color: textBlackColor),
                                              getCustomTextW6S36(
                                                  text: '1 BTC',
                                                  color: pinkAppColor),
                                              getCustomTextW6S12(
                                                  text: '= \$ 110,12.25',
                                                  color: subTextColor)
                                            ],
                                          ),
                                          getVerSpace(2.h),
                                          Container(
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                                color: subTextColor
                                                    .withOpacity(0.2),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.px))),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.h, vertical: 1.h),
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    getCustomTextW6S12(
                                                        text: 'Send Mode',
                                                        color: subTextColor),
                                                    getCustomTextW6S12(
                                                        text: 'Email',
                                                        color: textBlackColor),
                                                  ],
                                                ),
                                                getVerSpace(0.4.h),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    getCustomTextW6S12(
                                                        text: 'To',
                                                        color: subTextColor),
                                                    getCustomTextW6S12(
                                                        text:
                                                            '12345@gmail.com ',
                                                        color: textBlackColor),
                                                  ],
                                                ),
                                                getVerSpace(0.4.h),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    getCustomTextW6S12(
                                                        text: 'Amount',
                                                        color: subTextColor),
                                                    getCustomTextW6S12(
                                                        text: '1 BCD',
                                                        color: textBlackColor),
                                                  ],
                                                ),
                                                getVerSpace(0.4.h),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    getCustomTextW6S12(
                                                        text: 'Send from',
                                                        color: subTextColor),
                                                    getCustomTextW6S12(
                                                        text: 'Spot Wallet',
                                                        color: textBlackColor),
                                                  ],
                                                ),
                                                getVerSpace(0.4.h),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    getCustomTextW6S12(
                                                        text: 'Note',
                                                        color: subTextColor),
                                                    getCustomTextW6S12(
                                                        text: 'Send it!',
                                                        color: textBlackColor),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          getVerSpace(2.h),
                                          Container(
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                                color: subTextColor
                                                    .withOpacity(0.2),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.px))),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.h, vertical: 1.h),
                                            child: getCustomTextW6S12(
                                                text:
                                                    'Transactions are limited to crypto transfers between Binance accounts. Enjoy instant arrival with no fees. Refunds are not supported.',
                                                color: textBlackColor),
                                          )
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() =>
                                              const WithdrawPaymentVerificationScreen());
                                        },
                                        child: fillColorButton(
                                            color: pinkAppColor, text: 'Next'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: fillColorButton(
                              color: pinkAppColor, text: 'Send'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
