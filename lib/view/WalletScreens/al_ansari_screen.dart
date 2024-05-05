import 'package:algorthimi/view/BottomNavBar/bottom_nav_bar_freelancer_screen.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';

import 'dart:io';
import 'package:flutter_native_screenshot/flutter_native_screenshot.dart';
import 'package:http/http.dart' as http;

class AlAnsariExchangeScreen extends StatefulWidget {
  const AlAnsariExchangeScreen({Key? key}) : super(key: key);

  @override
  State<AlAnsariExchangeScreen> createState() => _AlAnsariExchangeScreenState();
}

class _AlAnsariExchangeScreenState extends State<AlAnsariExchangeScreen> {


  Future<void> _takeScreenshot(BuildContext context) async {
    try {
      final screenshotPath = await FlutterNativeScreenshot.takeScreenshot();
      await GallerySaver.saveImage(screenshotPath!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your details saved to gallery'),
        ),
      );
    } catch (e) {
      print("Error saving screenshot: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to save your detail'),
        ),
      );
    }
  }



  ////////////////transfer data for Api//////////////




  // Future<void> _takeScreenshot(BuildContext context) async {
  //   try {
  //     final screenshotPath = await FlutterNativeScreenshot.takeScreenshot();
  //
  //     // Send the screenshot to your server for S3 upload
  //     var request = http.MultipartRequest(
  //         'POST', Uri.parse('https://algo-app-api.ytech.systems/upload'));
  //     request.fields['image'] = 'image'; // Set API key as a form field with the name 'image'
  //     request.files.add(await http.MultipartFile.fromPath('image', screenshotPath!));
  //
  //     var response = await request.send();
  //
  //     if (response.statusCode == 200) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Screenshot uploaded to S3 successfully'),
  //         ),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Failed to upload screenshot to S3'),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     print("Error saving screenshot: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Failed to save screenshot'),
  //       ),
  //     );
  //   }
  // }


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
                    text: 'Congratulations',
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
                        text: 'Get cash from\nAl Ansari Exchange',
                        color: textBlackColor,
                        textAlign: TextAlign.center),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        getSvgImage('back_logo.svg', height: 29.h),
                        getSvgImage('qr_code.svg', height: 22.5.h),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () =>_takeScreenshot(context),
                          child: fillColorButton(
                              color: pinkAppColor, text: 'Download Receipt'),
                        ),
                        getVerSpace(1.5.h),
                        GestureDetector(
                          onTap: () {},
                          child: outlineButton(
                              color: backgroundColor,
                              borderColor: pinkAppColor,
                              text: 'Take Screenshot'),
                        ),
                        getVerSpace(1.5.h),
                        GestureDetector(
                          onTap: () {
                            Get.offAll(() => const BottomNavBarFreelancerScreen());
                          },
                          child: outlineButton(
                              color: backgroundColor,
                              borderColor: pinkAppColor,
                              text: 'Go to Dashboard'),
                        )
                      ],
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
