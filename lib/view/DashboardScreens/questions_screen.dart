import 'dart:developer';
import 'dart:io';

import 'package:algorthimi/utils/data.dart';
import 'package:algorthimi/view/AuthScreens/welldone_screen.dart';
import 'package:algorthimi/view/foot_step_counter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';

//ignore: must_be_immutable
class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({Key? key, this.userType}) : super(key: key);
  dynamic userType;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  TextEditingController selectBrand1Controller = TextEditingController();
  TextEditingController selectBrand2Controller = TextEditingController();
  TextEditingController selectBrand3Controller = TextEditingController();
  var counter = 0.obs;
  var yesNoButton = 0.obs;
  var currentIndex = 0.obs;
  final ImagePicker imagePicker = ImagePicker();
  File? takePhoto;

  Future captureImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        takePhoto = File(pickedFile.path);
      } else {
        log('No image selected.');
      }
    });
  }

  back() {
    Get.back();
    Get.back();
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
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: DataFile.questionsModel.length,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    height: 20.h,
                    width: 100.w,
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 6.h, left: 3.h, right: 3.h),
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
                            Get.back();
                            Get.back();
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back_ios_new_outlined,
                              color: backgroundColor, size: 2.5.h),
                        ),
                        const Spacer(),
                        Obx(
                              () => getCustomTextW6S22(
                            text:
                            '${'Question'.tr}  ${DataFile.questionsModel[currentIndex.value].questionNo}',
                            color: textWhiteColor,
                          ),
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
                      padding: EdgeInsets.only(top: 3.h),
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.symmetric(horizontal: 3.h),
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.px))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.h),
                            child: Column(
                              children: [
                                Obx(
                                      () => getCustomTextW6S15(
                                      text: DataFile
                                          .questionsModel[currentIndex.value]
                                          .questionTitle
                                          .toString()
                                          .tr,
                                      color: textBlackColor,
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                          takePhoto == null ||
                              DataFile.questionsModel[currentIndex.value]
                                  .questionType !=
                                  '3'
                              ? Column(
                            children: [
                              getVerSpace(10.h),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  getSvgImage('back_logo.svg',
                                      height: 25.h),
                                  Obx(
                                        () => Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 9.h),
                                      child: DataFile
                                          .questionsModel[
                                      currentIndex.value]
                                          .questionType ==
                                          '3'
                                          ? GestureDetector(
                                        onTap: () {
                                          captureImage();
                                        },
                                        child: outlineButton(
                                            text: 'Take Picture'.tr,
                                            borderColor:
                                            subTextColor,
                                            color: backgroundColor),
                                      )
                                          : DataFile
                                          .questionsModel[
                                      currentIndex
                                          .value]
                                          .questionType ==
                                          '2'
                                          ? Column(
                                        children: [
                                          Obx(
                                                () => outlineButton(
                                                text: counter
                                                    .value
                                                    .toString(),
                                                color:
                                                backgroundColor,
                                                borderColor:
                                                pinkAppColor),
                                          ),
                                          getVerSpace(2.h),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child:
                                                  GestureDetector(
                                                    onTap: () {
                                                      if (counter
                                                          .value >
                                                          0) {
                                                        counter
                                                            .value--;
                                                      }
                                                    },
                                                    child: outlineButton(
                                                        text: '-',
                                                        color:
                                                        backgroundColor,
                                                        borderColor:
                                                        subTextColor),
                                                  )),
                                              getHorSpace(2.h),
                                              Expanded(
                                                  child:
                                                  GestureDetector(
                                                    onTap: () {
                                                      counter
                                                          .value++;
                                                    },
                                                    child: outlineButton(
                                                        text: '+',
                                                        color:
                                                        backgroundColor,
                                                        borderColor:
                                                        subTextColor),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      )
                                          : DataFile
                                          .questionsModel[
                                      currentIndex
                                          .value]
                                          .questionType ==
                                          '1'
                                          ? Obx(
                                            () => Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                yesNoButton
                                                    .value = 1;
                                              },
                                              child: outlineButton(
                                                  text: 'Yes'
                                                      .tr,
                                                  color: yesNoButton.value ==
                                                      1
                                                      ? pinkAppColor
                                                      : backgroundColor,
                                                  borderColor:
                                                  pinkAppColor,
                                                  textColor: yesNoButton.value ==
                                                      1
                                                      ? textWhiteColor
                                                      : pinkAppColor),
                                            ),
                                            getVerSpace(
                                                2.h),
                                            GestureDetector(
                                              onTap: () {
                                                yesNoButton
                                                    .value = 2;
                                              },
                                              child: outlineButton(
                                                  text: 'No'
                                                      .tr,
                                                  color: yesNoButton.value ==
                                                      2
                                                      ? accentColor
                                                      : backgroundColor,
                                                  borderColor:
                                                  accentColor,
                                                  textColor: yesNoButton.value ==
                                                      2
                                                      ? textWhiteColor
                                                      : accentColor),
                                            ),
                                          ],
                                        ),
                                      )
                                          : Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color:
                                                backgroundColor,
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(15.px)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                    borderColor,
                                                    blurRadius:
                                                    10,
                                                    offset: const Offset(
                                                        0,
                                                        0), // changes position of shadow
                                                  ),
                                                ]),
                                            child:
                                            getCustomTextFormField(
                                                keyboardType:
                                                TextInputType
                                                    .text,
                                                obscureText:
                                                false,
                                                readOnly:
                                                true,
                                                hintText:
                                                'Select Brand'
                                                    .tr,
                                                controller:
                                                selectBrand1Controller,
                                                suffixIcon: Icon(
                                                    Icons
                                                        .arrow_drop_down_rounded,
                                                    color:
                                                    subTextColor),
                                                onTap:
                                                    () {
                                                  showModalBottomSheet<
                                                      void>(
                                                    context:
                                                    context,
                                                    elevation:
                                                    5,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Container(
                                                        width: 100.w,
                                                        height: 25.h,
                                                        padding: EdgeInsets.symmetric(vertical: 2.h),
                                                        decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(15.px), topRight: Radius.circular(15.px))),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                selectBrand1Controller.text = 'Marlboro'.toString().tr;
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                width: 100.w,
                                                                alignment: Alignment.center,
                                                                margin: EdgeInsets.symmetric(horizontal: 3.h),
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(color: textBlackColor),
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(10.px),
                                                                    )),
                                                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                                                child: getCustomTextW6S15(
                                                                  text: 'Marlboro'.tr,
                                                                  color: textBlackColor,
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                selectBrand1Controller.text = 'Dunhill'.toString().tr;
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                width: 100.w,
                                                                alignment: Alignment.center,
                                                                margin: EdgeInsets.symmetric(horizontal: 3.h),
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(color: textBlackColor),
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(10.px),
                                                                    )),
                                                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                                                child: getCustomTextW6S15(
                                                                  text: 'Dunhill'.tr,
                                                                  color: textBlackColor,
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                selectBrand1Controller.text = 'Pan masala'.toString().tr;
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                width: 100.w,
                                                                alignment: Alignment.center,
                                                                margin: EdgeInsets.symmetric(horizontal: 3.h),
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(color: textBlackColor),
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(10.px),
                                                                    )),
                                                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                                                child: getCustomTextW6S15(
                                                                  text: 'Pan masala'.tr,
                                                                  color: textBlackColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }),
                                          ),
                                          getVerSpace(
                                              1.5.h),
                                          Container(
                                            decoration: BoxDecoration(
                                                color:
                                                backgroundColor,
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(15.px)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                    borderColor,
                                                    blurRadius:
                                                    10,
                                                    offset: const Offset(
                                                        0,
                                                        0), // changes position of shadow
                                                  ),
                                                ]),
                                            child:
                                            getCustomTextFormField(
                                                keyboardType:
                                                TextInputType
                                                    .text,
                                                obscureText:
                                                false,
                                                readOnly:
                                                true,
                                                hintText:
                                                'Select Brand'
                                                    .tr,
                                                controller:
                                                selectBrand2Controller,
                                                suffixIcon: Icon(
                                                    Icons
                                                        .arrow_drop_down_rounded,
                                                    color:
                                                    subTextColor),
                                                onTap:
                                                    () {
                                                  showModalBottomSheet<
                                                      void>(
                                                    context:
                                                    context,
                                                    elevation:
                                                    5,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Container(
                                                        width: 100.w,
                                                        height: 25.h,
                                                        padding: EdgeInsets.symmetric(vertical: 2.h),
                                                        decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(15.px), topRight: Radius.circular(15.px))),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                selectBrand2Controller.text = 'Marlboro'.toString().tr;
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                width: 100.w,
                                                                alignment: Alignment.center,
                                                                margin: EdgeInsets.symmetric(horizontal: 3.h),
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(color: textBlackColor),
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(10.px),
                                                                    )),
                                                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                                                child: getCustomTextW6S15(
                                                                  text: 'Marlboro'.tr,
                                                                  color: textBlackColor,
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                selectBrand2Controller.text = 'Dunhill'.toString().tr;
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                width: 100.w,
                                                                alignment: Alignment.center,
                                                                margin: EdgeInsets.symmetric(horizontal: 3.h),
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(color: textBlackColor),
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(10.px),
                                                                    )),
                                                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                                                child: getCustomTextW6S15(
                                                                  text: 'Dunhill'.tr,
                                                                  color: textBlackColor,
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                selectBrand2Controller.text = 'Pan masala'.toString().tr;
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                width: 100.w,
                                                                alignment: Alignment.center,
                                                                margin: EdgeInsets.symmetric(horizontal: 3.h),
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(color: textBlackColor),
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(10.px),
                                                                    )),
                                                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                                                child: getCustomTextW6S15(
                                                                  text: 'Pan masala'.tr,
                                                                  color: textBlackColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }),
                                          ),
                                          getVerSpace(
                                              1.5.h),
                                          Container(
                                            decoration: BoxDecoration(
                                                color:
                                                backgroundColor,
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(15.px)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                    borderColor,
                                                    blurRadius:
                                                    10,
                                                    offset: const Offset(
                                                        0,
                                                        0), // changes position of shadow
                                                  ),
                                                ]),
                                            child:
                                            getCustomTextFormField(
                                                keyboardType:
                                                TextInputType
                                                    .text,
                                                obscureText:
                                                false,
                                                readOnly:
                                                true,
                                                hintText:
                                                'Select Brand'
                                                    .tr,
                                                controller:
                                                selectBrand3Controller,
                                                suffixIcon: Icon(
                                                    Icons
                                                        .arrow_drop_down_rounded,
                                                    color:
                                                    subTextColor),
                                                onTap:
                                                    () {
                                                  showModalBottomSheet<
                                                      void>(
                                                    context:
                                                    context,
                                                    elevation:
                                                    5,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Container(
                                                        width: 100.w,
                                                        height: 25.h,
                                                        padding: EdgeInsets.symmetric(vertical: 2.h),
                                                        decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(15.px), topRight: Radius.circular(15.px))),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                selectBrand3Controller.text = 'Marlboro'.toString().tr;
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                width: 100.w,
                                                                alignment: Alignment.center,
                                                                margin: EdgeInsets.symmetric(horizontal: 3.h),
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(color: textBlackColor),
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(10.px),
                                                                    )),
                                                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                                                child: getCustomTextW6S15(
                                                                  text: 'Marlboro'.tr,
                                                                  color: textBlackColor,
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                selectBrand3Controller.text = 'Dunhill'.toString().tr;
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                width: 100.w,
                                                                alignment: Alignment.center,
                                                                margin: EdgeInsets.symmetric(horizontal: 3.h),
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(color: textBlackColor),
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(10.px),
                                                                    )),
                                                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                                                child: getCustomTextW6S15(
                                                                  text: 'Dunhill'.tr,
                                                                  color: textBlackColor,
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                selectBrand3Controller.text = 'Pan masala'.toString().tr;
                                                                Get.back();
                                                              },
                                                              child: Container(
                                                                width: 100.w,
                                                                alignment: Alignment.center,
                                                                margin: EdgeInsets.symmetric(horizontal: 3.h),
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(color: textBlackColor),
                                                                    borderRadius: BorderRadius.all(
                                                                      Radius.circular(10.px),
                                                                    )),
                                                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                                                child: getCustomTextW6S15(
                                                                  text: 'Pan masala'.tr,
                                                                  color: textBlackColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              getVerSpace(20.h),
                            ],
                          )
                              : Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 50.h,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 3.h),
                                    decoration: BoxDecoration(
                                        color: borderColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.px)),
                                        image: DecorationImage(
                                            image: FileImage(takePhoto!),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    captureImage();
                                  },
                                  child: outlineButton(
                                      text: 'Take Picture'.tr,
                                      borderColor: subTextColor,
                                      color: backgroundColor),
                                ),
                                getVerSpace(1.h),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {});
                              if (DataFile.questionsModel[currentIndex.value]
                                  .questionType ==
                                  '1') {
                                if (yesNoButton.value != 0) {
                                  yesNoButton.value = 0;
                                  if (currentIndex.value <
                                      DataFile.questionsModel.length - 1) {
                                    currentIndex.value++;
                                  } else {
                                    Get.to(() => const FootStepCounter());
                                    // Get.to(() => WellDoneScreen(
                                    //       screenTitle: 'question',
                                    //       userType: widget.userType,
                                    //     )
                                    // );
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Select Option'.tr,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: pinkAppColor,
                                      textColor: textWhiteColor,
                                      fontSize: 14.0);
                                }
                              } else if (DataFile
                                  .questionsModel[currentIndex.value]
                                  .questionType ==
                                  '2') {
                                if (counter.value != 0) {
                                  if (currentIndex.value <
                                      DataFile.questionsModel.length - 1) {
                                    currentIndex.value++;
                                  } else {
                                    Get.to(() => const FootStepCounter());
                                    // Get.to(() => WellDoneScreen(
                                    //       screenTitle: 'question',
                                    //       userType: widget.userType,
                                    //     )
                                    // );
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Select Amount'.tr,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: pinkAppColor,
                                      textColor: textWhiteColor,
                                      fontSize: 14.0);
                                }
                              } else if (DataFile
                                  .questionsModel[currentIndex.value]
                                  .questionType ==
                                  '3') {
                                if (takePhoto != null) {
                                  if (currentIndex.value <
                                      DataFile.questionsModel.length - 1) {
                                    currentIndex.value++;
                                  } else {
                                    Get.to(() => const FootStepCounter());
                                    // Get.to(() => WellDoneScreen(
                                    //       screenTitle: 'question',
                                    //       userType: widget.userType,
                                    //     ));
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Upload Image'.tr,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: pinkAppColor,
                                      textColor: textWhiteColor,
                                      fontSize: 14.0);
                                }
                              } else if (DataFile
                                  .questionsModel[currentIndex.value]
                                  .questionType ==
                                  '4') {
                                if (selectBrand1Controller.text.isNotEmpty &&
                                    selectBrand2Controller.text.isNotEmpty &&
                                    selectBrand3Controller.text.isNotEmpty) {
                                  if (currentIndex.value <
                                      DataFile.questionsModel.length - 1) {
                                    currentIndex.value++;
                                  } else {
                                    Get.to(() => const FootStepCounter());
                                    // Get.to(() => WellDoneScreen(
                                    //       screenTitle: 'question',
                                    //       userType: widget.userType,
                                    //     ));
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Select Brand'.tr,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: pinkAppColor,
                                      textColor: textWhiteColor,
                                      fontSize: 14.0);
                                }
                              }
                            },
                            child: fillColorButton(
                                color: pinkAppColor, text: 'Next'.tr),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}