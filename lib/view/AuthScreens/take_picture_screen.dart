import 'dart:developer';
import 'dart:io';

import 'package:algorthimi/utils/app_color.dart';
import 'package:algorthimi/view/id_scan.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../DashboardScreens/questions_screen.dart';
import '../Widgets/widget_utils.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http/http.dart' as http;

import 'Widgets/scan_id_shop_owner_screen.dart';

class TakePictureScreen extends StatefulWidget {
  TakePictureScreen({Key? key, this.isSelectSignUp, this.userType})
      : super(key: key);
  dynamic isSelectSignUp;
  dynamic userType;

  @override
  State<TakePictureScreen> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  bool _isLoading = false;
  final ImagePicker imagePicker = ImagePicker();
  File? takePhoto;

  Future captureImage() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      requestFullMetadata: true,
    );
    setState(() {
      if (pickedFile != null) {
        takePhoto = File(pickedFile.path);
        // _saveToGallery();
      } else {
        log('No image selected.');
      }
    });
  }

  // Future<void> _saveToGallery() async {
  //   if (takePhoto != null) {
  //     await GallerySaver.saveImage(takePhoto!.path);
  //     print('Image saved to gallery');
  //   }
  // }

  Future pickImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        takePhoto = File(pickedFile.path);
        // _saveToGallery();
      } else {
        log('No image selected.');
      }
    });
  }

  back() {
    widget.isSelectSignUp == 2 || widget.isSelectSignUp == 3
        ? Get.back()
        : null;
    Get.back();
    Get.back();
  }

  Future<void> _takeScreenshot(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true; // Set loading state to true
      });

      if (takePhoto != null) {
        final File imageFile = takePhoto!;

        List<int> compressedImage =
            (await FlutterImageCompress.compressWithFile(
          imageFile.path,
          minHeight: 1024,
          minWidth: 1024,
          quality: 100,
        )) as List<int>;

        print("image size ${compressedImage.length}");

        var request = http.MultipartRequest(
          'POST',
          Uri.parse('https://algo-app-api.ytech.systems/upload'),
        );

        request.fields['image'] = 'image';
        request.files.add(http.MultipartFile.fromBytes('image', compressedImage,
            filename: '${DateTime.now()}.jpg'));

        var response = await request.send();

        if (response.statusCode == 200) {
          Get.snackbar(
            'Success',
            'Your detail uploaded on server',
            duration: const Duration(seconds: 3),
            backgroundColor: const Color(pink),
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            'Error',
            'Failed to upload detail',
            duration: const Duration(seconds: 3),
            backgroundColor: const Color(pink),
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'No image selected.',
          duration: const Duration(seconds: 3),
          backgroundColor: const Color(pink),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("Error capturing and uploading image: $e");
      Get.snackbar(
        'Error',
        'Failed to capture and upload image',
        duration: const Duration(seconds: 3),
        backgroundColor: const Color(pink),
        colorText: Colors.white,
      );
    } finally {
      setState(() {
        _isLoading = false; // Reset loading state
      });
    }
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
          height: 110.h,
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
                        widget.isSelectSignUp == 2 || widget.isSelectSignUp == 3
                            ? Get.back()
                            : null;
                        Get.back();
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios_new_outlined,
                          color: backgroundColor, size: 2.5.h),
                    ),
                    const Spacer(),
                    getCustomTextW6S22(
                        text: 'Upload Selfie'.tr,
                        color: textWhiteColor,
                        textAlign: TextAlign.center),
                    const Spacer()
                  ],
                ),
              ),
              Positioned(
                top: 15.h,
                right: 0,
                left: 0,
                child: SingleChildScrollView(
                  child: Container(
                    width: 100.h,
                    height: 80.h,
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.symmetric(horizontal: 3.h),
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.px))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.isSelectSignUp == 2 || widget.isSelectSignUp == 3
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.h),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: getCustomTextW6S15(
                                      text:
                                          'Take Selfie for starting Questionnaire'
                                              .tr,
                                      color: textBlackColor,
                                      textAlign: TextAlign.center),
                                ),
                              )
                            : getCustomTextW6S15(
                                text: '',
                                color: textBlackColor,
                                textAlign: TextAlign.center),
                        takePhoto == null
                            ? SizedBox(
                                height: 45.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        getSvgImage('back_logo.svg',
                                            height: 25.h),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 9.h),
                                            child: GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet<void>(
                                                  context: context,
                                                  elevation: 5,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Container(
                                                      height: widget.isSelectSignUp ==
                                                                  2 ||
                                                              widget.isSelectSignUp ==
                                                                  3
                                                          ? 15.h
                                                          : 27.h,
                                                      width: 100.w,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3.h,
                                                              vertical: 2.h),
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
                                                          widget.isSelectSignUp ==
                                                                      2 ||
                                                                  widget.isSelectSignUp ==
                                                                      3
                                                              ? Container()
                                                              : Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child: getCustomTextW6S20(
                                                                          text: widget.isSelectSignUp == 2 || widget.isSelectSignUp == 3
                                                                              ? 'Take Selfie'.tr
                                                                              : 'Take / Upload'.tr,
                                                                          color: accentColor),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .close,
                                                                        color:
                                                                            subTextColor,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                          Column(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  captureImage();
                                                                  Get.back();
                                                                },
                                                                child: fillColorButton(
                                                                    text:
                                                                        'Take Selfie'
                                                                            .tr,
                                                                    color:
                                                                        pinkAppColor),
                                                              ),
                                                              getVerSpace(
                                                                  1.4.h),
                                                              widget.isSelectSignUp ==
                                                                          2 ||
                                                                      widget.isSelectSignUp ==
                                                                          3
                                                                  ? Container()
                                                                  : GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        pickImage();
                                                                        Get.back();
                                                                      },
                                                                      child: outlineButton(
                                                                          text: 'Upload from Gallery'
                                                                              .tr,
                                                                          color:
                                                                              backgroundColor,
                                                                          borderColor:
                                                                              pinkAppColor)),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: outlineButton(
                                                  text: widget.isSelectSignUp ==
                                                              2 ||
                                                          widget.isSelectSignUp ==
                                                              3
                                                      ? 'Take Selfie'.tr
                                                      : 'Take / Upload'.tr,
                                                  borderColor: subTextColor,
                                                  color: backgroundColor),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 50.h,
                                        margin:
                                            EdgeInsets.symmetric(vertical: 3.h),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: FileImage(takePhoto!),
                                                fit: BoxFit.contain)),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          elevation: 5,
                                          builder: (BuildContext context) {
                                            return Container(
                                              height: widget.isSelectSignUp ==
                                                          2 ||
                                                      widget.isSelectSignUp == 3
                                                  ? 15.h
                                                  : 27.h,
                                              width: 100.w,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.h,
                                                  vertical: 2.h),
                                              decoration: BoxDecoration(
                                                  color: backgroundColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  15.px),
                                                          topRight:
                                                              Radius.circular(
                                                                  15.px))),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  widget.isSelectSignUp == 2 ||
                                                          widget.isSelectSignUp ==
                                                              3
                                                      ? Container()
                                                      : Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: getCustomTextW6S20(
                                                                  text: widget.isSelectSignUp == 2 ||
                                                                          widget.isSelectSignUp ==
                                                                              3
                                                                      ? 'Take Selfie'
                                                                          .tr
                                                                      : 'Take / Upload'
                                                                          .tr,
                                                                  color:
                                                                      accentColor),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                              child: Icon(
                                                                Icons.close,
                                                                color:
                                                                    subTextColor,
                                                                size: 20,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                  Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          captureImage();
                                                          Get.back();
                                                        },
                                                        child: fillColorButton(
                                                            text: 'Take Selfie'
                                                                .tr,
                                                            color:
                                                                pinkAppColor),
                                                      ),
                                                      getVerSpace(1.4.h),
                                                      widget.isSelectSignUp == 2 ||
                                                              widget.isSelectSignUp ==
                                                                  3
                                                          ? Container()
                                                          : GestureDetector(
                                                              onTap: () {
                                                                pickImage();
                                                                Get.back();
                                                              },
                                                              child: outlineButton(
                                                                  text:
                                                                      'Upload from Gallery'
                                                                          .tr,
                                                                  color:
                                                                      backgroundColor,
                                                                  borderColor:
                                                                      pinkAppColor)),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: outlineButton(
                                          text: widget.isSelectSignUp == 2 ||
                                                  widget.isSelectSignUp == 3
                                              ? 'Take Selfie'.tr
                                              : 'Take / Upload'.tr,
                                          borderColor: subTextColor,
                                          color: backgroundColor),
                                    ),
                                    getVerSpace(1.h),
                                  ],
                                ),
                              ),
                        GestureDetector(
                          onTap: () async {
                            if (takePhoto == null) {
                              Fluttertoast.showToast(
                                  msg: widget.isSelectSignUp == 2 ||
                                          widget.isSelectSignUp == 3
                                      ? 'Take Selfie'.tr
                                      : 'Take / Upload'.tr,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: pinkAppColor,
                                  textColor: textWhiteColor,
                                  fontSize: 14.0);
                            } else {
                              await _takeScreenshot(context);
                              if (widget.isSelectSignUp == 0) {
                                Get.to(() => CnicScan());
                              } else if (widget.isSelectSignUp == 1) {
                                Get.to(() => const ScanIdShopOwnerScreen());
                              } else {
                                if (widget.userType == 'freelancer') {
                                  Get.to(() => QuestionsScreen());
                                } else {
                                  Get.to(() => QuestionsScreen());
                                }
                              }
                            }
                          },
                          child: _isLoading
                              ? const CircularProgressIndicator()
                              : fillColorButton(
                                  color: pinkAppColor,
                                  text: 'Next'.tr,
                                ),
                        )
                      ],
                    ),
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
