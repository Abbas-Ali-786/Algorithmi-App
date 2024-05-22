import 'package:algorthimi/view/AuthScreens/welldone_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import '../utils/app_color.dart';
import 'AuthScreens/Widgets/welldone_screen.dart';
import 'Widgets/widget_utils.dart';

class FootStepCounter extends StatefulWidget {
  const FootStepCounter({super.key});

  @override
  State<FootStepCounter> createState() => _FootStepCounterState();
}

class _FootStepCounterState extends State<FootStepCounter> {
  late Stream<StepCount> _stepCountStream;
  int _totalSteps = 0;
  late int minus = 0;
  late int plus = 0;
  static late int cal;
  bool _isCountingSteps = false;
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  late DateTime _startDate;
  bool _startButtonClicked = false;

  // Conversion factor: 1 meter^2 = 10.7639 square feet
  final double squareFeetPerSquareMeter = 2.50;

  // Conversion factor: 1 square meter = 0.005 marlas
  final double marlasPerSquareMeter = 0.005;

  // Assuming an average stride length of 0.75 meters
  final double averageStrideLengthMeters = 0.75;

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
    _initPedometer();
  }

  void _initPedometer() {
    _stepCountStream = Pedometer.stepCountStream;
    bool isCalculated = false; // Flag to track if cal has been assigned
    _stepCountStream.listen((StepCount event) {
      if (_isCountingSteps) {
        setState(() {
          if (_startDate.day != DateTime.now().day) {
            _resetSteps();
          }
          _totalSteps = event.steps;
          if (!isCalculated) {
            cal = _totalSteps;
            isCalculated = true; // Set the flag to true after assigning cal
          }
          minus = _totalSteps - cal;
          // plus = ((_totalSteps - cal) - minus);
        });
      }
    });
  }

  void _inPedometer() {
    _stepCountStream = Pedometer.stepCountStream;
    bool isCalculated = false; // Flag to track if cal has been assigned
    _stepCountStream.listen((StepCount event) {
      if (_isCountingSteps) {
        setState(() {
          if (_startDate.day != DateTime.now().day) {
            _resetSteps();
          }
          _totalSteps = event.steps;
          if (!isCalculated) {
            cal = _totalSteps;
            isCalculated = true; // Set the flag to true after assigning cal
          }
          plus = _totalSteps - cal;
        });
      }
    });
  }

  void _resetSteps() {
    _startDate = DateTime.now();
    _totalSteps = 0;
    // minus = _totalSteps - 6774; // Update minus whenever _totalSteps changes
  }

  void _startCountingSteps() {
    setState(() {
      _isCountingSteps = true;
      _stopwatch.start();
      _startTimer();
      // Set the flag to true when Start button is clicked
      _startButtonClicked = false;
    });
  }

  void _stopCountingSteps() {
    setState(() {
      _isCountingSteps = false;
      _stopwatch.stop();
      _stopTimer();
    });
  }

  void _resetTime() {
    setState(() {
      _stopwatch.reset();
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  void _stopTimer() {
    _timer.cancel();
  }

  String _formatElapsedTime(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  double _calculateDistanceInSquareMeters(int steps) {
    return steps * averageStrideLengthMeters;
  }

  double _convertSquareMetersToSquareFeet(double squareMeters) {
    return squareMeters * squareFeetPerSquareMeter;
  }

  double _convertSquareMetersToMarlas(double squareMeters) {
    return squareMeters * marlasPerSquareMeter;
  }

  //////////////////////////////////////////////////////////////////////

  int _clickCount = 0;
  List<String> buttonTexts = [
    'Click here',
    'Stop',
    'Start walking left or right',
    'Stop'
  ];
  bool saveButtonEnabled = false; // Track if Save button should be enabled

  void _changeText() {
    setState(() {
      if (_clickCount < 4) {
        _clickCount++;
      }
      if (_clickCount == 1 || _clickCount == 3) {
        // Start counting steps
        _startCountingSteps();
      } else if (_clickCount == 2 || _clickCount == 4) {
        // Stop counting steps
        _stopCountingSteps();
      }
      if (_clickCount == 4) {
        saveButtonEnabled = true; // Enable Save button after clicking 4 times
      }

      // Update the footsteps count and calculate distance
      if (_clickCount == 3) {
        // Calculate new steps when user starts walking left or right
        _inPedometer();
      }

    });
  }



  @override
  Widget build(BuildContext context) {
    double distanceInSquareMeters = _calculateDistanceInSquareMeters(minus);
    double distanceInSquareFeet =
    _convertSquareMetersToSquareFeet(distanceInSquareMeters);

    double distanceInSquareMeters2 = _calculateDistanceInSquareMeters(plus);
    double distanceInSquareFeet2 =
    _convertSquareMetersToSquareFeet(distanceInSquareMeters2);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Area measurement of store',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white,),
        ),
        backgroundColor: const Color(purple),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text(
            //       'timer : ',
            //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            //     ),
            //     Text(
            //       _formatElapsedTime(_stopwatch.elapsed),
            //       style: const TextStyle(
            //         fontSize: 24,
            //       ),
            //     ),
            //   ],
            // ),

            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 45.w,
                  height: 13.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.black,
                      // You can specify any color you want here
                      width: 2.0, // You can adjust the width of the border
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: getCustomTextW6S20(
                            text: 'Side 1'.tr, color: Colors.black),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getCustomTextW6S15(
                              text: 'Steps : '.tr, color: Colors.black),
                          getCustomTextW6S15(
                              text: '$minus', color: Colors.black),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getCustomTextW6S15(
                              text: 'Area : '.tr, color: Colors.black),
                          getCustomTextW6S15(
                              text: '${distanceInSquareFeet.toStringAsFixed(2)}'
                                  .tr,
                              color: Colors.black),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 45.w,
                  height: 13.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.black,
                      // You can specify any color you want here
                      width: 2.0, // You can adjust the width of the border
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getCustomTextW6S20(
                          text: 'Side 2'.tr, color: Colors.black),
                      const Divider(
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getCustomTextW6S15(
                              text: 'Steps : '.tr, color: Colors.black),
                          getCustomTextW6S15(
                              text: '$plus'.tr, color: Colors.black),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getCustomTextW6S15(
                              text: 'Area : '.tr, color: Colors.black),
                          getCustomTextW6S15(
                              text:
                              '${distanceInSquareFeet2.toStringAsFixed(2)}'
                                  .tr,
                              color: Colors.black),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),

            Container(
                height: 7.h,
                width: 85.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.black,
                    // You can specify any color you want here
                    width: 2.0, // You can adjust the width of the border
                  ),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getCustomTextW6S22(
                          text: 'Total area :  '.tr, color: Colors.black),
                      getCustomTextW6S22(
                          text:
                          '${(distanceInSquareFeet * distanceInSquareFeet2).toStringAsFixed(2)} sq ft'
                              .tr,
                          color: Colors.black),
                    ],
                  ),
                )),

            const SizedBox(
              height: 50,
            ),

            Container(
              width: 65.w,
              height: 6.h,
              child: GestureDetector(
                onTap: () {
                  _changeText();
                  // _startCountingSteps;
                },
                child: fillColorButton(
                  color: pinkAppColor,
                  text: _clickCount < 4
                      ? buttonTexts[_clickCount]
                      : 'Area calculate complete'.tr,
                ),
              ),
            ),

            const SizedBox(
              height: 40,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   '$_totalSteps',
                //   style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                // ),
                Container(
                  width: 45.w,
                  height: 6.h,
                  child: GestureDetector(
                      onTap: () {
                        // _stopCountingSteps;
                      },
                      child: Column(
                        children: [

                          if (_clickCount == 1 && _totalSteps <= 0)
                            const CircularProgressIndicator(),
                          if (_totalSteps > 0)
                            fillColorButton(
                              // color: pinkAppColor,
                              text: 'Pedometer start'.tr,
                              color: _totalSteps > 0 ? const Color(purple) : Colors.grey,
                            ),
                        ],
                      )
                    // fillColorButton(
                    //   // color: pinkAppColor,
                    //   text: 'Start walking'.tr,
                    //   color: _totalSteps > 0 ? const Color(purple): Colors.grey,
                    // ),
                  ),
                ),

                const SizedBox(
                  width: 30,
                ),

                Container(
                  width: 32.w,
                  height: 5.h,
                  child: GestureDetector(
                    onTap: saveButtonEnabled
                        ? () {
                      _startCountingSteps();
                      // Your onPressed functionality here
                    }
                        : null,
                    child: Container(
                      decoration: saveButtonEnabled
                          ? BoxDecoration(
                        color: const Color(purple),
                        borderRadius: BorderRadius.circular(
                            8.0), // Add border radius if needed
                      )
                          : BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                            8.0), // Add border radius if needed
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              // Change text color according to your design
                              fontSize:
                              16.0, // Change font size according to your design
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //

            const SizedBox(
              height: 135,
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  if (saveButtonEnabled) {
                    Get.to(() => WellDoneScreen());
                    // Get.offAll(() => const BottomNavBarFreelancerScreen());
                  } else {
                    Get.snackbar(
                      'Alert',
                      'Please calculate shop area and click save',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: const Color(pink),
                      colorText: Colors.white,
                    );
                  }
                },
                child: fillColorButton(
                  color: pinkAppColor,
                  text: 'Next'.tr,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}