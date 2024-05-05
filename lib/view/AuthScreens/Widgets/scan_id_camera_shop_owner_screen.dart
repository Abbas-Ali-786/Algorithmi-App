import 'dart:async';

import 'package:algorthimi/view/AuthScreens/Widgets/scan_id_camera_screen.dart';
import 'package:algorthimi/view/Widgets/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../utils/color_data.dart';

String? scanText;

class ScanIdCameraShopOwnerScreen extends StatefulWidget {
  const ScanIdCameraShopOwnerScreen({Key? key}) : super(key: key);

  @override
  State<ScanIdCameraShopOwnerScreen> createState() =>
      _ScanIdCameraShopOwnerScreenState();
}

class _ScanIdCameraShopOwnerScreenState
    extends State<ScanIdCameraShopOwnerScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      Get.to(() => const ScannerScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getCustomTextW6S16(
                text:
                    'Please Place the back of your\nTrade License inside the frame'.tr,
                color: textWhiteColor,
                textAlign: TextAlign.center),
            getVerSpace(10.h),
            getSvgImage('scan_id_white_shop_owner.svg', height: 40.h)
          ],
        ),
      ),
    );
  }
}

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

// Add the WidgetsBindingObserver mixin
class _ScannerScreenState extends State<ScannerScreen>
    with WidgetsBindingObserver {
  bool _isPermissionGranted = false;
  final textRecognizer = TextRecognizer();

  late final Future<void> _future;

  // Add this controller to be able to control de camera
  CameraController? _cameraController;

  back() {
    Get.back();
    Get.back();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _future = _requestCameraPermission();
  }

  // We should stop the camera once this widget is disposed
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopCamera();
    textRecognizer.close();
    super.dispose();
  }

  // Starts and stops the camera according to the lifecycle of the app
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      _stopCamera();
    } else if (state == AppLifecycleState.resumed &&
        _cameraController != null &&
        _cameraController!.value.isInitialized) {
      _startCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          return Stack(
            children: [
              // Show the camera feed behind everything
              if (_isPermissionGranted)
                FutureBuilder<List<CameraDescription>>(
                  future: availableCameras(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      _initCameraController(snapshot.data!);

                      return Center(child: CameraPreview(_cameraController!));
                    } else {
                      return const LinearProgressIndicator();
                    }
                  },
                ),
              Scaffold(
                // Set the background to transparent so you can see the camera preview
                backgroundColor:
                    _isPermissionGranted ? Colors.transparent : null,
                body: _isPermissionGranted
                    ? Column(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: Center(
                                child: OutlinedButton(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll(
                                            backgroundColor),
                                        overlayColor: MaterialStatePropertyAll(
                                            pinkAppColor.withOpacity(0.1)),
                                        side: MaterialStateProperty.all(BorderSide(
                                            color: pinkAppColor,
                                            width: 1,
                                            style: BorderStyle.solid)),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.px)))),
                                        padding: MaterialStatePropertyAll(
                                            EdgeInsets.symmetric(horizontal: 3.h))),
                                    onPressed: _scanImage,
                                    child: getCustomTextW6S16(text: 'Scan License'.tr, color: pinkAppColor))),
                          ),
                        ],
                      )
                    : Center(
                        child: Container(
                          padding:
                              const EdgeInsets.only(left: 24.0, right: 24.0),
                          child: const Text(
                            'Camera permission denied',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    _isPermissionGranted = status == PermissionStatus.granted;
  }

  void _startCamera() {
    if (_cameraController != null) {
      _cameraSelected(_cameraController!.description);
    }
  }

  void _stopCamera() {
    if (_cameraController != null) {
      _cameraController?.dispose();
    }
  }

  void _initCameraController(List<CameraDescription> cameras) {
    if (_cameraController != null) {
      return;
    }

    // Select the first rear camera.
    CameraDescription? camera;
    for (var i = 0; i < cameras.length; i++) {
      final CameraDescription current = cameras[i];
      if (current.lensDirection == CameraLensDirection.back) {
        camera = current;
        break;
      }
    }

    if (camera != null) {
      _cameraSelected(camera);
    }
  }

  Future<void> _cameraSelected(CameraDescription camera) async {
    _cameraController = CameraController(
      camera,
      ResolutionPreset.max,
      enableAudio: false,
    );

    await _cameraController!.initialize();

    if (!mounted) {
      return;
    }
    setState(() {});
  }

  Future<void> _scanImage() async {
    isScannedFreelancerId.value = true;
    isScannedShopOwnerId.value = true;
    isScannedShopOwnerLicense.value = true;
    if (_cameraController == null) return;
    try {
      final pictureFile = await _cameraController!.takePicture();

      final file = File(pictureFile.path);

      final inputImage = InputImage.fromFile(file);
      final recognizedText = await textRecognizer.processImage(inputImage);

      scanText = recognizedText.text;
      Get.back();
      Get.back();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred when scanning text'),
        ),
      );
    }
  }
}
