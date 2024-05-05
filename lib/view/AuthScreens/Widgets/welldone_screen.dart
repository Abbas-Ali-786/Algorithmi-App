import 'package:algorthimi/routes/app-routes.dart';
import 'package:algorthimi/view/BottomNavBar/bottom_nav_bar_freelancer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/color_data.dart';
import '../../BottomNavBar/bottom_nav_bar_shop_owner_screen.dart';
import '../../Widgets/widget_utils.dart';

//ignore: must_be_immutable
class WellDoneScreen extends StatefulWidget {
  WellDoneScreen(
      {Key? key, this.screenTitle, this.selectedMethod, this.userType})
      : super(key: key);
  dynamic screenTitle;
  dynamic selectedMethod;
  dynamic userType;

  @override
  State<WellDoneScreen> createState() => _WellDoneScreenState();
}

class _WellDoneScreenState extends State<WellDoneScreen> {
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
                    text: widget.screenTitle == 'otp'
                        ? 'WellDone'.tr
                        : 'Congratulations'.tr,
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
                    Column(
                      children: [
                        getSvgImage(
                            widget.screenTitle == 'otp' ||
                                widget.screenTitle == 'otpLicense' ||
                                widget.screenTitle == 'addBank'
                                ? 'welldone_smile.svg'
                                : 'congratulations_smile.svg',
                            height: widget.screenTitle == 'otp' ||
                                widget.screenTitle == 'otpLicense'
                                ? 6.5.h
                                : 7.h),
                        getVerSpace(2.h),
                        getCustomTextW6S15(
                            text: widget.screenTitle == 'otp' ||
                                widget.screenTitle == 'otpLicense'
                                ? 'You have successfully registered\nyour ALGORITHMI account'.tr
                                : widget.screenTitle == 'addBank'
                                ? '${'You have successfully added\nyour'.tr} ${widget.selectedMethod} Account'
                                : widget.screenTitle == 'uploadFile'
                                ? 'You\'re upload file and Submitted\nfor review'.tr
                                : 'Your survey has been Finished and\nSubmitted for review'.tr,
                            color: textBlackColor,
                            textAlign: TextAlign.center),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        getSvgImage('back_logo.svg', height: 29.h),
                        getSvgImage(
                            widget.screenTitle == 'otp' ||
                                widget.screenTitle == 'otpLicense' ||
                                widget.screenTitle == 'addBank'
                                ? 'welldone_first.svg'
                                : 'congratulations_first.svg',
                            height: widget.screenTitle == 'otp' ||
                                widget.screenTitle == 'otpLicense'
                                ? 20.h
                                : 22.5.h),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.screenTitle == 'otpLicense' ||
                            widget.userType == 'shopOwner' ? Get.offAllNamed(AppRoutes.BOTTOMNAVBARSHOPOWNER)
                            // ? Get.offAll(
                            //     () => const BottomNavBarShopOwnerScreen())
                            : Get.offAll(
                                () => const BottomNavBarFreelancerScreen());
                      },
                      child: fillColorButton(
                          color: pinkAppColor, text: 'Go to Dashboard'.tr),
                    )
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

























// import 'package:algorthimi/view/BottomNavBar/bottom_nav_bar_freelancer_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// import '../../utils/color_data.dart';
// import '../BottomNavBar/bottom_nav_bar_shop_owner_screen.dart';
// import '../Widgets/widget_utils.dart';
// import 'dart:async';
// import 'package:pedometer/pedometer.dart';
// import 'package:intl/intl.dart';
//
//
// //ignore: must_be_immutable
// class WellDoneScreen extends StatefulWidget {
//   WellDoneScreen(
//       {Key? key, this.screenTitle, this.selectedMethod, this.userType})
//       : super(key: key);
//   dynamic screenTitle;
//   dynamic selectedMethod;
//   dynamic userType;
//
//   @override
//   State<WellDoneScreen> createState() => _WellDoneScreenState();
// }
//
// class _WellDoneScreenState extends State<WellDoneScreen> {
//
//   late Stream<StepCount> _stepCountStream;
//   int _totalSteps = 0;
//   late int minus = 0;
//   static late int cal;
//   bool _isCountingSteps = false;
//   Stopwatch _stopwatch = Stopwatch();
//   late Timer _timer;
//   late DateTime _startDate;
//   bool _startButtonClicked = false;
//
//   // Conversion factor: 1 meter^2 = 10.7639 square feet
//   final double squareFeetPerSquareMeter = 10.7639;
//   // Conversion factor: 1 square meter = 0.005 marlas
//   final double marlasPerSquareMeter = 0.005;
//
//   // Assuming an average stride length of 0.75 meters
//   final double averageStrideLengthMeters = 0.75;
//
//   @override
//   void initState() {
//     super.initState();
//     _startDate = DateTime.now();
//     _initPedometer();
//   }
//
//   void _initPedometer() {
//     _stepCountStream = Pedometer.stepCountStream;
//     bool isCalculated = false; // Flag to track if cal has been assigned
//     _stepCountStream.listen((StepCount event) {
//       if (_isCountingSteps) {
//         setState(() {
//           if (_startDate.day != DateTime.now().day) {
//             _resetSteps();
//           }
//           _totalSteps = event.steps;
//           if (!isCalculated) {
//             cal = _totalSteps;
//             isCalculated = true; // Set the flag to true after assigning cal
//           }
//           minus = _totalSteps - cal; // Update minus whenever _totalSteps changes
//         });
//       }
//     });
//   }
//
//   void _resetSteps() {
//     _startDate = DateTime.now();
//     _totalSteps = 0;
//     // minus = _totalSteps - 6774; // Update minus whenever _totalSteps changes
//   }
//
//   void _startCountingSteps() {
//     setState(() {
//       _isCountingSteps = true;
//       _stopwatch.start();
//       _startTimer();
//       // Set the flag to true when Start button is clicked
//       _startButtonClicked = true;
//     });
//   }
//
//   void _stopCountingSteps() {
//     setState(() {
//       _isCountingSteps = false;
//       _stopwatch.stop();
//       _stopTimer();
//     });
//   }
//
//   void _resetTime() {
//     setState(() {
//       _stopwatch.reset();
//     });
//   }
//
//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {});
//     });
//   }
//
//   void _stopTimer() {
//     _timer.cancel();
//   }
//
//   String _formatElapsedTime(Duration duration) {
//     final minutes = duration.inMinutes;
//     final seconds = duration.inSeconds % 60;
//     return '$minutes:${seconds.toString().padLeft(2, '0')}';
//   }
//
//   double _calculateDistanceInSquareMeters(int steps) {
//     return steps * averageStrideLengthMeters;
//   }
//
//   double _convertSquareMetersToSquareFeet(double squareMeters) {
//     return squareMeters * squareFeetPerSquareMeter;
//   }
//
//   double _convertSquareMetersToMarlas(double squareMeters) {
//     return squareMeters * marlasPerSquareMeter;
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     double distanceInSquareMeters = _calculateDistanceInSquareMeters(minus);
//     double distanceInSquareFeet = _convertSquareMetersToSquareFeet(distanceInSquareMeters);
//     double distanceInMarlas = _convertSquareMetersToMarlas(distanceInSquareMeters);
//
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: backgroundColor,
//       body: SizedBox(
//         height: 100.h,
//         width: 100.h,
//         child: Stack(
//           children: [
//             Container(
//               height: 20.h,
//               width: 100.w,
//               alignment: Alignment.topCenter,
//               padding: EdgeInsets.only(top: 6.h, left: 3.h, right: 3.h),
//               decoration: BoxDecoration(
//                   color: accentColor,
//                   borderRadius:
//                   BorderRadius.only(bottomRight: Radius.circular(4.h))),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Get.back();
//                     },
//                     child: Icon(Icons.arrow_back_ios_new_outlined,
//                         color: backgroundColor, size: 2.5.h),
//                   ),
//                   const Spacer(),
//                   getCustomTextW6S22(
//                     text: widget.screenTitle == 'otp'
//                         ? 'WellDone'.tr
//                         : 'Congratulations'.tr,
//                     color: textWhiteColor,
//                   ),
//                   const Spacer()
//                 ],
//               ),
//             ),
//             Positioned(
//               top: 15.h,
//               right: 0,
//               left: 0,
//               child: Container(
//                 width: 100.h,
//                 height: 100.h - 20.h,
//                 padding: EdgeInsets.only(top: 2.h),
//                 alignment: Alignment.topCenter,
//                 margin: EdgeInsets.symmetric(horizontal: 3.h),
//                 decoration: BoxDecoration(
//                     color: backgroundColor,
//                     borderRadius: BorderRadius.all(Radius.circular(10.px))),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children: [
//                         getSvgImage(
//                             widget.screenTitle == 'otp' ||
//                                 widget.screenTitle == 'otpLicense' ||
//                                 widget.screenTitle == 'addBank'
//                                 ? 'welldone_smile.svg'
//                                 : 'congratulations_smile.svg',
//                             height: widget.screenTitle == 'otp' ||
//                                 widget.screenTitle == 'otpLicense'
//                                 ? 6.5.h
//                                 : 7.h),
//                         getVerSpace(2.h),
//                         getCustomTextW6S15(
//                             text: widget.screenTitle == 'otp' ||
//                                 widget.screenTitle == 'otpLicense'
//                                 ? 'You have successfully registered\nyour ALGORITHMI account'.tr
//                                 : widget.screenTitle == 'addBank'
//                                 ? '${'You have successfully added\nyour'.tr} ${widget.selectedMethod} Account'
//                                 : widget.screenTitle == 'uploadFile'
//                                 ? 'You\'re upload file and Submitted\nfor review'.tr
//                                 : 'Calculate store area'.tr,
//                             color: textBlackColor,
//                             textAlign: TextAlign.center),
//                       ],
//                     ),
//                     Stack(
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'You take total Steps:',
//                               style: TextStyle(fontSize: 20),
//                             ),
//                             Text(
//                               '$_totalSteps',
//                               style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 10),
//                             Text(
//                               'Total current Steps you are taken:',
//                               style: TextStyle(fontSize: 20),
//                             ),
//                             Text(
//                               '$minus',
//                               style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 10),
//                             Text(
//                               'Total Distance (Square Feet):',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                             Text(
//                               '${distanceInSquareFeet.toStringAsFixed(2)}',
//                               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 10),
//                             Text(
//                               'Total Distance (Marlas):',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                             Text(
//                               '${distanceInMarlas.toStringAsFixed(2)}',
//                               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 20),
//                             Text(
//                               'Elapsed Time:',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                             Text(
//                               _formatElapsedTime(_stopwatch.elapsed),
//                               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 20),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: _startCountingSteps,
//                                   child: Text('Start', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
//                                 ),
//                                 SizedBox(width: 30),
//                                 ElevatedButton(
//                                   onPressed: _stopCountingSteps,
//                                   child: Text('Stop', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         // Check if the Start button has been clicked before allowing navigation
//                         if (_startButtonClicked) {
//                           widget.screenTitle == 'otpLicense' || widget.userType == 'shopOwner'
//                               ? Get.offAll(() => const BottomNavBarShopOwnerScreen())
//                               : Get.offAll(() => const BottomNavBarFreelancerScreen());
//                         } else {
//                           // Display a snackbar indicating that the Start button hasn't been clicked
//                           Get.snackbar(
//                             'Alert', // Title of the snackbar
//                             'Please calculate area first.', // Message of the snackbar
//                             snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
//                             backgroundColor: Colors.red, // Background color of the snackbar
//                             colorText: Colors.white, // Text color of the snackbar
//                           );
//                         }
//                       },
//                       child: fillColorButton(
//                         color: pinkAppColor,
//                         text: 'Go to Dashboard'.tr,
//                       ),
//                     )
//
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
