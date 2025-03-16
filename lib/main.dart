import 'package:algorthimi/routes/app-routes.dart';
import 'package:algorthimi/view/DashboardScreens/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'controller/geo_location_controller.dart';
import 'view/languages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LocationController locationController =
      Get.put(LocationController(), tag: 'locationController');

  @override
  void initState() {
    super.initState();
    _requestPedometerPermission();
  }

  Future<void> _requestPedometerPermission() async {
    final PermissionStatus status = await Permission.activityRecognition.status;
    if (!status.isGranted) {
      final PermissionStatus result =
          await Permission.activityRecognition.request();
      if (!result.isGranted) {
        // Handle denial of permission
        print('Permission not granted');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: Language(),
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          getPages: AppRoutes.routes,
          initialRoute: AppRoutes.SPLASH,
          theme: ThemeData(
            fontFamily: 'Urbanist',
            useMaterial3: true,
            colorScheme: const ColorScheme.light(background: Colors.white),
          ),
          // home: const SplashScreen(),
        );
      },
    );
  }
}
