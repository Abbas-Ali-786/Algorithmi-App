import 'dart:async';
import 'dart:developer';
import 'package:algorthimi/view/DashboardScreens/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/pedometer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../AuthScreens/take_picture_screen.dart';
import '../Widgets/widget_utils.dart';

//ignore: must_be_immutable
class StartQuestionsScreen extends StatefulWidget {
  StartQuestionsScreen({Key? key, this.userType}) : super(key: key);
  dynamic userType;

  @override
  State<StartQuestionsScreen> createState() => _StartQuestionsScreenState();
}

class _StartQuestionsScreenState extends State<StartQuestionsScreen> {
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 60 * 60;
  var currentSeconds = 0.obs;
  Timer? surveyTimer;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds.value) ~/ 60).toString().padLeft(2, '0')} : ${((timerMaxSeconds - currentSeconds.value) % 60).toString().padLeft(2, '0')}';

  startTimeout() {
    var duration = interval;
    surveyTimer = Timer.periodic(duration, (timer) {
      log(timer.tick.toString());
      currentSeconds.value = timer.tick;
      if (timer.tick >= timerMaxSeconds) timer.cancel();
    });
  }


  //////////////////////////////////

  late Stream<StepCount> _stepCountStream;
  int _totalSteps = 0;
  bool _isCountingSteps = false;
  final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;

  // Conversion factor: 1 meter^2 = 10.7639 square feet
  final double squareFeetPerSquareMeter = 10.7639;
  // Conversion factor: 1 square meter = 0.005 marlas
  final double marlasPerSquareMeter = 0.005;

  // Assuming an average stride length of 0.75 meters
  final double averageStrideLengthMeters = 0.75;

  @override
  void initState() {
    startTimeout();
    super.initState();
    _initPedometer();
  }

  void _initPedometer() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen((StepCount event) {
      if (_isCountingSteps) {
        setState(() {
          _totalSteps = event.steps;
        });
      }
    });
  }

  void _startCountingSteps() {
    setState(() {
      _isCountingSteps = true;
      _stopwatch.start();
      _startTimer();
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
      _totalSteps = 0;
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


  @override
  void dispose() {
    surveyTimer!.cancel();
    super.dispose();
  }

  back() {
    Get.back();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {

    double distanceInSquareMeters = _calculateDistanceInSquareMeters(_totalSteps);
    double distanceInSquareFeet = _convertSquareMetersToSquareFeet(distanceInSquareMeters);
    double distanceInMarlas = _convertSquareMetersToMarlas(distanceInSquareMeters);



    return Obx(
          () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: WillPopScope(
          onWillPop: () {
            return back();
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100.h,
                  height: 85.h,
                  padding: EdgeInsets.only(
                      top: 20.h, right: 3.h, left: 3.h, bottom: 2.h),
                  decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(20.h))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getCustomTextW6S20(
                              text: 'Let’s Start...'.tr, color: textWhiteColor),
                          const SizedBox(height: 20,),
                          Column(
                            children: [
                              getCustomTextW6S17(
                                  text: 'Quick Supermarket, Majan'.tr,
                                  color: textWhiteColor),
                              getVerSpace(3.h),
                              getCustomTextW6S17(
                                  text: 'Your slot has been blocked for\n60 min'.tr,
                                  color: textWhiteColor,
                                  textAlign: TextAlign.center),
                            ],
                          ),
                          const SizedBox(height: 60,),
                          timerButton(
                            text: timerText,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.h, left: 3.h, right: 3.h),
                  child: GestureDetector(
                    onTap: () {
                      widget.userType.toString() == 'freelancer'
                          ? Get.to(() => TakePictureScreen(
                        isSelectSignUp: 2,
                        userType: widget.userType,
                      ))
                          : Get.to(() => TakePictureScreen(
                        isSelectSignUp: 3,
                        userType: widget.userType,
                      ));
                    },
                    child: fillColorButton(
                        text: 'Start Survey Now!'.tr, color: pinkAppColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
