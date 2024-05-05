import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';


class StepCounterScreen extends StatefulWidget {
  @override
  _StepCounterScreenState createState() => _StepCounterScreenState();
}

class _StepCounterScreenState extends State<StepCounterScreen> {
  late Stream<StepCount> _stepCountStream;
  int _totalSteps = 0;
  bool _isCountingSteps = false;
  Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;

  // Conversion factor: 1 meter^2 = 10.7639 square feet
  final double squareFeetPerSquareMeter = 10.7639;
  // Conversion factor: 1 square meter = 0.005 marlas
  final double marlasPerSquareMeter = 0.005;

  // Assuming an average stride length of 0.75 meters
  final double averageStrideLengthMeters = 0.75;

  @override
  void initState() {
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
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
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
  Widget build(BuildContext context) {
    double distanceInSquareMeters = _calculateDistanceInSquareMeters(_totalSteps);
    double distanceInSquareFeet = _convertSquareMetersToSquareFeet(distanceInSquareMeters);
    double distanceInMarlas = _convertSquareMetersToMarlas(distanceInSquareMeters);

    return Scaffold(
      appBar: AppBar(title: Text('Step Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Steps:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_totalSteps',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Total Distance (Square Feet):',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '${distanceInSquareFeet.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Total Distance (Marlas):',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '${distanceInMarlas.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Elapsed Time:',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              _formatElapsedTime(_stopwatch.elapsed),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startCountingSteps,
                  child: Text('Start'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _stopCountingSteps,
                  child: Text('Stop'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetTime,
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
