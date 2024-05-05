import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../WalletScreens/add_card.dart';
import '../WalletScreens/select_bank.dart';
import '../WalletScreens/wallet_screen.dart';
import '../Widgets/widget_utils.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  var selectedPaymentMethod = 0.obs;

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
                          text: 'Accounts'.tr,
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
                          text: 'Saved Payment Methods'.tr, color: accentColor),
                      getVerSpace(2.h),
                      Expanded(
                        child: SizedBox(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: withDrawTransferTitle.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                height: 7.h,
                                width: 100.w,
                                padding: EdgeInsets.symmetric(horizontal: 3.h),
                                margin: EdgeInsets.symmetric(
                                    vertical: 0.5.h, horizontal: 1.h),
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
                                        text: withDrawTransferTitle[index].toString().tr,maxLines: 1,
                                        color: textBlackColor,),
                                    getCustomTextW6S12(
                                        text: withDrawTransferSubTitle[index].toString().tr,
                                        color: subTextColor),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              elevation: 5,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 38.h,
                                  width: 100.w,
                                  padding: EdgeInsets.only(
                                      right: 3.h,
                                      left: 3.h,
                                      bottom: 4.h,
                                      top: 2.h),
                                  decoration: BoxDecoration(
                                      color: backgroundColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15.px),
                                          topRight: Radius.circular(15.px))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              getCustomTextW6S20(
                                                  text: 'Add Payment Method'.tr,
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
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: paymentMethodList.length,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.h),
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  selectedPaymentMethod.value =
                                                      index;
                                                },
                                                child: Obx(
                                                  () => Container(
                                                    color: backgroundColor,
                                                    margin: EdgeInsets.only(
                                                        bottom: 2.h),
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
                                                                      color: selectedPaymentMethod.value ==
                                                                              index
                                                                          ? accentColor
                                                                          : borderColor,
                                                                      width: selectedPaymentMethod.value ==
                                                                              index
                                                                          ? 4.px
                                                                          : 1.5
                                                                              .px)),
                                                            ),
                                                            getHorSpace(2.h),
                                                            getCustomTextW6S16(
                                                              text:
                                                                  paymentMethodList[
                                                                          index]
                                                                      .toString()
                                                                      .tr,
                                                              color:
                                                                  subTextColor,
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
                                                          selectedPaymentMethod
                                                              .value] ==
                                                      "Credit/Debit Card"
                                                  ? AddCard(
                                                      selectedMethod:
                                                          paymentMethodList[
                                                              selectedPaymentMethod
                                                                  .value],
                                                    )
                                                  : SelectBankScreen(
                                                      selectedMethod:
                                                          paymentMethodList[
                                                              selectedPaymentMethod
                                                                  .value],
                                                    ));
                                            },
                                            child: fillColorButton(
                                                text: 'Add'.tr,
                                                color: pinkAppColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: fillColorButton(
                              text: 'Add New'.tr, color: pinkAppColor)),
                      getVerSpace(4.h),
                    ],
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
