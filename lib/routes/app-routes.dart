import 'package:algorthimi/view/AuthScreens/forgot_password_screen.dart';
import 'package:algorthimi/view/AuthScreens/login_screen.dart';
import 'package:algorthimi/view/SplashLanguageScreens/language_screen.dart';
import 'package:algorthimi/view/SplashLanguageScreens/splash_screen.dart';
import 'package:get/get.dart';

import '../view/AuthScreens/take_picture_screen.dart';
import '../view/BottomNavBar/bottom_nav_bar_freelancer_screen.dart';
import '../view/BottomNavBar/bottom_nav_bar_shop_owner_screen.dart';
import '../view/SettingScreens/setting_screen.dart';

class AppRoutes {
  static const SPLASH = "/splash";
  static const LANGUAGE = "/language";
  static const FORGOTPASSWORD = "/forgotPassword";
  static const BOTTOMNAVBARSHOPOWNER = "/bottomNavShopOwner";
  static const BOTTOMNAVBARFREELANCE = "/bottomNavShopFreelance";
  static const TAKEPICSCREEN = "/takePicScreen";
  static const LOGINSCREEN = "/loginScreen";
  static const SETTINGSCREEN = "/settingScfreen";

  
  static final routes = [
    GetPage(name: SPLASH, page: () => const SplashScreen()),
    GetPage(name: LANGUAGE, page: () => const LanguageScreen()),
    GetPage(name: FORGOTPASSWORD, page: () => const ForgotPasswordScreen()),
    GetPage(
        name: BOTTOMNAVBARSHOPOWNER,
        page: () => const BottomNavBarShopOwnerScreen()),
    GetPage(name: TAKEPICSCREEN, page: () => TakePictureScreen()),
    GetPage(name: LOGINSCREEN, page: () => const LoginScreen()),
    GetPage(
        name: BOTTOMNAVBARFREELANCE,
        page: () => const BottomNavBarFreelancerScreen()),
    GetPage(name: SETTINGSCREEN, page: () => const SettingScreen()),
  ];
}
