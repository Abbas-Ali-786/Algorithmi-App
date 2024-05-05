import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../AuthScreens/Widgets/welldone_screen.dart';
import '../Widgets/widget_utils.dart';

//ignore: must_be_immutable
class UploadFileScreen extends StatefulWidget {
  UploadFileScreen({Key? key, this.title}) : super(key: key);
  dynamic title;

  @override
  State<UploadFileScreen> createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  FilePickerResult? selectedFile;

  void selectFile() async {
    selectedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    },
                    child: Icon(Icons.arrow_back_ios_new_outlined,
                        color: backgroundColor, size: 2.5.h),
                  ),

                  const Spacer(),
                  
                  getCustomTextW6S22(
                    text: widget.title.toString().tr,
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
                padding: EdgeInsets.only(top: 2.h),
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(horizontal: 3.h),
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.px))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getCustomTextW6S15(
                        text: '',
                        color: textBlackColor,
                        textAlign: TextAlign.center),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        getSvgImage('back_logo.svg', height: 29.h),
                        selectedFile != null
                            ? SizedBox(
                                height: 30.h,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        getSvgImage('excel_icon.svg',
                                            height: 15.h),
                                        getVerSpace(1.h),
                                        getCustomTextW6S15(
                                            text: selectedFile!.files.first.name
                                                .toString(),
                                            color: textBlackColor,
                                            textAlign: TextAlign.center)
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        selectFile();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 9.h),
                                        child: outlineButton(
                                            text: 'Upload File'.tr,
                                            borderColor: subTextColor,
                                            color: backgroundColor),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  selectFile();
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 9.h),
                                  child: outlineButton(
                                      text: 'Upload File'.tr,
                                      borderColor: subTextColor,
                                      color: backgroundColor),
                                ),
                              ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        if (selectedFile != null) {
                          Get.to(() => WellDoneScreen(
                                screenTitle: 'uploadFile',
                                userType: 'shopOwner',
                              ));
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Select File'.tr,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: pinkAppColor,
                              textColor: textWhiteColor,
                              fontSize: 14.0);
                        }
                      },
                      child: fillColorButton(color: pinkAppColor, text: 'Next'.tr),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
