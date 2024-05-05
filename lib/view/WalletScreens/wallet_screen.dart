import 'package:algorthimi/view/WalletScreens/al_ansari_screen.dart';
import 'package:algorthimi/view/WalletScreens/select_bank.dart';
import 'package:algorthimi/view/WalletScreens/withdraw_crypto_screen.dart';
import 'package:algorthimi/view/WalletScreens/withdraw_other_method_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';
import 'add_card.dart';
import 'congratulation_screen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  var switchValue = true.obs;
  var selectedAccount = 0.obs;
  var selectedPaymentMethod = 0.obs;
  var valueSlider = 100.0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            SizedBox(
              height: 45.h,
              width: 100.h,
              child: Stack(
                children: [
                  Container(
                    height: 20.h,
                    width: 100.w,
                    alignment: Alignment.topCenter,
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
                          onTap: () {},
                          child: Container(),
                        ),
                        const Spacer(),
                        getCustomTextW6S22(
                          text: 'Wallet'.tr,
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
                    child: Obx(
                      () => Container(
                        width: 100.h,
                        height: 28.h,
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 3.h),
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.symmetric(horizontal: 3.h),
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            boxShadow: [
                              BoxShadow(
                                color: borderColor,
                                blurRadius: 1,
                                offset: const Offset(
                                    0, 2), // changes position of shadow
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.px))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                getCustomTextW6S15(
                                    text: 'Coins'.tr,
                                    color: switchValue.value == false
                                        ? pinkAppColor
                                        : subTextColor),
                                getHorSpace(0.5.h),
                                // FlutterSwitch(
                                //   height: 17.0,
                                //   width: 30.0,
                                //   padding: 2.0,
                                //   toggleSize: 12.0,
                                //   borderRadius: 10.0,
                                //   inactiveColor: pinkAppColor,
                                //   activeColor: accentColor,
                                //   value: switchValue.value,
                                //   onToggle: (value) {
                                //     switchValue.value = value;
                                //     selectedAccount.value = 0;
                                //   },
                                // ),
                                getHorSpace(0.5.h),
                                getCustomTextW6S15(
                                    text: 'Cash'.tr,
                                    color: switchValue.value == true
                                        ? accentColor
                                        : subTextColor),
                              ],
                            ),
                            SizedBox(
                              width: 100.w,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    getCustomTextW6S15(
                                        text: 'You currently have'.tr,
                                        color: textBlackColor),
                                    getCustomTextW6S30(
                                        text: switchValue.value != true
                                            ? '10 ${'Coins'.tr}'.tr
                                            : 'AED 500.00'.tr,
                                        color: switchValue.value != true
                                            ? pinkAppColor
                                            : accentColor),
                                    switchValue.value == true
                                        ? const SizedBox()
                                        : getCustomTextW6S16(
                                            text: '= AED 100'.tr,
                                            color: subTextColor),
                                  ]),
                            ),
                            switchValue.value == false
                                ? const SizedBox()
                                : SizedBox(
                                    width: 100.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SliderTheme(
                                          data:
                                              SliderTheme.of(context).copyWith(
                                            activeTrackColor: accentColor,
                                            inactiveTrackColor: borderColor,
                                            trackShape:
                                                const RoundedRectSliderTrackShape(),
                                            trackHeight: 0.8.h,
                                            thumbShape: RoundSliderThumbShape(
                                                enabledThumbRadius: 1.0.h),
                                            thumbColor: accentColor,
                                            overlayColor: backgroundColor,
                                            overlayShape:
                                                RoundSliderOverlayShape(
                                                    overlayRadius: 0.h),
                                            tickMarkShape:
                                                const RoundSliderTickMarkShape(),
                                            activeTickMarkColor: accentColor,
                                            inactiveTickMarkColor: borderColor,
                                            valueIndicatorShape:
                                                const PaddleSliderValueIndicatorShape(),
                                            valueIndicatorColor: accentColor,
                                            valueIndicatorTextStyle: TextStyle(
                                              color: textWhiteColor,
                                            ),
                                          ),
                                          child: Slider(
                                            value: valueSlider.value,
                                            min: 100,
                                            max: 1000,
                                            divisions: 9,
                                            label:
                                                '${valueSlider.value.toInt()}',
                                            onChanged: (value) {
                                              valueSlider.value = value;
                                            },
                                          ),
                                        ),
                                        getVerSpace(0.5.h),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              getCustomTextW6S10(
                                                  text: 'AED 100',
                                                  color: subTextColor),
                                              getCustomTextW6S10(
                                                  text: 'AED 1000',
                                                  color: subTextColor),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.h),
              child: Column(
                children: [
                  getVerSpace(3.h),
                  GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          elevation: 5,
                          builder: (BuildContext context) {
                            return Container(
                              height: 23.5.h,
                              width: 100.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.h, vertical: 2.h),
                              decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.px),
                                      topRight: Radius.circular(15.px))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      getCustomTextW6S20(
                                          text: 'Link Account'.tr,
                                          color: accentColor),
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
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => SelectBankScreen(
                                                selectedMethod: 'Bank Account',
                                              ));
                                        },
                                        child: fillColorButton(
                                            text: 'Bank Account'.tr,
                                            color: pinkAppColor),
                                      ),
                                      getVerSpace(1.4.h),
                                      GestureDetector(
                                          onTap: () {
                                            Get.to(() => SelectBankScreen(
                                                  selectedMethod: 'E-Wallet',
                                                ));
                                          },
                                          child: outlineButton(
                                              text: 'E-Wallet'.tr,
                                              color: backgroundColor,
                                              borderColor: pinkAppColor)),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: fillColorButton(
                          text: 'Link Account'.tr, color: pinkAppColor)),
                  getVerSpace(1.5.h),
                  GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          elevation: 5,
                          builder: (BuildContext context) {
                            return Container(
                              height: 50.h,
                              width: 100.w,
                              padding: EdgeInsets.only(
                                  right: 3.h, left: 3.h, bottom: 4.h, top: 2.h),
                              decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.px),
                                      topRight: Radius.circular(15.px))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: getCustomTextW6S20(
                                                text: switchValue.value == true
                                                    ? 'Transfer to Bank/E-Wallet'
                                                        .tr
                                                    : 'Withdraw'.tr,
                                                color: accentColor),
                                          ),
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
                                      SizedBox(
                                        height: 21.h,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.h),
                                          itemCount: switchValue.value == true
                                              ? withDrawTransferTitle.length
                                              : withDrawTitle.length,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                selectedAccount.value = index;
                                              },
                                              child: Obx(
                                                () => Container(
                                                  color: backgroundColor,
                                                  margin: EdgeInsets.only(
                                                      bottom: 1.1.h),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 1.8.h,
                                                            height: 1.8.h,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border: Border.all(
                                                                    color: selectedAccount.value ==
                                                                            index
                                                                        ? accentColor
                                                                        : borderColor,
                                                                    width: selectedAccount.value ==
                                                                            index
                                                                        ? 4.px
                                                                        : 1.5
                                                                            .px)),
                                                          ),
                                                          getHorSpace(2.h),
                                                          Expanded(
                                                            child: getCustomTextW6S16(
                                                              text: switchValue
                                                                          .value ==
                                                                      true
                                                                  ? withDrawTransferTitle[
                                                                          index]
                                                                      .toString()
                                                                      .tr
                                                                  : withDrawTitle[
                                                                          index]
                                                                      .toString()
                                                                      .tr,
                                                              color: subTextColor,
                                                              textAlign: TextAlign.start
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 1.8.h,
                                                            height: 1.8.h,
                                                          ),
                                                          getHorSpace(2.h),
                                                          Expanded(
                                                            child: getCustomTextW6S15(
                                                              text: switchValue
                                                                          .value ==
                                                                      true
                                                                  ? withDrawTransferSubTitle[
                                                                      index]
                                                                  : withDrawSubTitle[
                                                                          index]
                                                                      .toString()
                                                                      .tr,
                                                              color: subTextColor,
                                                              textAlign: TextAlign.start
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          switchValue.value == true
                                              ? Get.to(() =>
                                                  CongratulationTransferBankEWalletScreen(
                                                    selectedMethod:
                                                        withDrawTransferTitle[
                                                                selectedAccount
                                                                    .value]
                                                            .toString()
                                                            .tr,
                                                  ))
                                              : selectedAccount.value == 1
                                                  ? Get.to(() =>
                                                      const WithdrawOtherMethodScreen())
                                                  : Get.to(() =>
                                                      const WithdrawCryptoScreen());
                                        },
                                        child: fillColorButton(
                                            text: 'Transfer'.tr,
                                            color: pinkAppColor),
                                      ),
                                      getVerSpace(1.4.h),
                                      switchValue.value == false
                                          ? Container()
                                          : GestureDetector(
                                              onTap: () {
                                                Get.back();
                                                showModalBottomSheet<void>(
                                                  context: context,
                                                  elevation: 5,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Container(
                                                      height: 38.h,
                                                      width: 100.w,
                                                      padding: EdgeInsets.only(
                                                          right: 3.h,
                                                          left: 3.h,
                                                          bottom: 4.h,
                                                          top: 2.h),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              backgroundColor,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(15
                                                                          .px),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          15.px))),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  getCustomTextW6S20(
                                                                      text: 'Add Payment Method'
                                                                          .tr,
                                                                      color:
                                                                          accentColor),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Get.back();
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .close,
                                                                      color:
                                                                          subTextColor,
                                                                      size: 20,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              ListView.builder(
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount:
                                                                    paymentMethodList
                                                                        .length,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            2.h),
                                                                physics:
                                                                    const NeverScrollableScrollPhysics(),
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      selectedPaymentMethod
                                                                              .value =
                                                                          index;
                                                                    },
                                                                    child: Obx(
                                                                      () =>
                                                                          Container(
                                                                        color:
                                                                            backgroundColor,
                                                                        margin: EdgeInsets.only(
                                                                            bottom:
                                                                                2.h),
                                                                        child:
                                                                            Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: 1.8.h,
                                                                                  height: 1.8.h,
                                                                                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: selectedPaymentMethod.value == index ? accentColor : borderColor, width: selectedPaymentMethod.value == index ? 4.px : 1.5.px)),
                                                                                ),
                                                                                getHorSpace(2.h),
                                                                                getCustomTextW6S16(
                                                                                  text: paymentMethodList[index].toString().tr,
                                                                                  color: subTextColor,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.to(() => paymentMethodList[
                                                                              selectedPaymentMethod.value] ==
                                                                          "Credit/Debit Card"
                                                                      ? AddCard(
                                                                          selectedMethod:
                                                                              paymentMethodList[selectedPaymentMethod.value],
                                                                        )
                                                                      : SelectBankScreen(
                                                                          selectedMethod:
                                                                              paymentMethodList[selectedPaymentMethod.value],
                                                                        ));
                                                                },
                                                                child: fillColorButton(
                                                                    text: 'Add'
                                                                        .tr,
                                                                    color:
                                                                        pinkAppColor),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: outlineButton(
                                                  text: 'Add New'.tr,
                                                  borderColor: pinkAppColor,
                                                  color: backgroundColor)),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: outlineButton(
                          text: 'Withdrawal Money'.tr,
                          color: backgroundColor,
                          borderColor: pinkAppColor)),
                  getVerSpace(1.5.h),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const AlAnsariExchangeScreen());
                    },
                    child: outlineButton(
                        text: 'Al Ansari Exchange'.tr,
                        color: backgroundColor,
                        borderColor: pinkAppColor),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List withDrawTitle = [
  "Send via crypto network",
  "Send via email/ Phone/ Pay ID",
];
List withDrawSubTitle = [
  "send to a known crypto address\nvia crypto network",
  "Recipient must be a Algorthmi user",
];

List withDrawTransferTitle = [
  "First Abu Dhabi Bank",
  "Dubai Islamic Bank",
  "Etisalat Wallet",
  "Magnati",
];
List withDrawTransferSubTitle = [
  "xxx-xxxxx-xxxxxx",
  "xxx-xxxxx-xxxxxx",
  "xxx-xxxxx-xxxxxx",
  "xxx-xxxxx-xxxxxx",
];
List paymentMethodList = [
  // "Credit/Debit Card",
  "Bank Account",
  "E-Wallet",
];
