import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';
import 'congratulation_screen.dart';

class WithdrawCryptoScreen extends StatefulWidget {
  const WithdrawCryptoScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawCryptoScreen> createState() => _WithdrawCryptoScreenState();
}

class _WithdrawCryptoScreenState extends State<WithdrawCryptoScreen> {
  TextEditingController coinController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController networkController = TextEditingController();
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
                      text: 'Withdraw Crypto',
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: getCustomTextW6S15(
                                    text: 'Select Coin', color: textBlackColor),
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
                                    hintText: 'Coin'.tr,
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
                                    text: 'Withdraw to', color: textBlackColor),
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
                                    hintText: 'Address'.tr,
                                    controller: addressController,
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
                                    text: 'Network', color: textBlackColor),
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
                                    hintText: 'BTC Bitcoin (BTC)'.tr,
                                    controller: networkController,
                                    suffixIcon: Icon(
                                        Icons.arrow_drop_down_rounded,
                                        color: subTextColor),
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                          getVerSpace(0.5.h),
                          Row(
                            children: [
                              Expanded(
                                child: getCustomTextW6S15(
                                    text: '', color: textBlackColor),
                              ),
                              getHorSpace(2.h),
                              Expanded(
                                flex: 3,
                                child: getCustomTextW6S12(
                                    text:
                                        'Wallet address automatically matched to corresponding network',
                                    color: greenColor),
                              ),
                            ],
                          ),
                          getVerSpace(1.5.h),
                          Row(
                            children: [
                              Expanded(
                                child: getCustomTextW6S15(
                                    text: '', color: textBlackColor),
                              ),
                              getHorSpace(2.h),
                              Expanded(
                                flex: 3,
                                child: getCustomTextW6S12(
                                    text: 'BTC available',
                                    color: subTextColor,
                                    textAlign: TextAlign.right),
                              ),
                              getHorSpace(1.h),
                            ],
                          ),
                          getVerSpace(0.5.h),
                          Row(
                            children: [
                              Expanded(
                                child: getCustomTextW6S15(
                                    text: 'Withdraw Amount',
                                    color: textBlackColor),
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
                          getVerSpace(0.5.h),
                          Row(
                            children: [
                              Expanded(
                                child: getCustomTextW6S15(
                                    text: '', color: textBlackColor),
                              ),
                              getHorSpace(2.h),
                              Expanded(
                                flex: 3,
                                child: getCustomTextW6S12(
                                    text:
                                        '100 BTC /100 BTC  24h remaining limit ',
                                    color: greenColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          getCustomTextW6S15(
                              text: 'Receive amount', color: textBlackColor),
                          getCustomTextW6S36(
                              text: '0.99950000 BTC', color: pinkAppColor),
                          getCustomTextW6S12(
                              text: '0.0005 BTC network fee included',
                              color: subTextColor)
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => CongratulationTransferBankEWalletScreen(
                                selectedMethod: 'withdrawCrypto',
                              ));
                        },
                        child: fillColorButton(
                            color: pinkAppColor, text: 'Withdraw'),
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
