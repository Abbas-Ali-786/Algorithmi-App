import 'package:algorthimi/utils/color_data.dart';
import 'package:algorthimi/view/DashboardScreens/dashboard_shop_owner_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../SettingScreens/setting_screen.dart';
import '../WalletScreens/wallet_screen.dart';
import '../Widgets/widget_utils.dart';

class BottomNavBarShopOwnerScreen extends StatefulWidget {
  const BottomNavBarShopOwnerScreen({super.key});

  @override
  State<BottomNavBarShopOwnerScreen> createState() =>
      _BottomNavBarShopOwnerScreenState();
}

class _BottomNavBarShopOwnerScreenState
    extends State<BottomNavBarShopOwnerScreen> {
  var selectedIndex = 0.obs;

  static const List<Widget> _widgetOptions = <Widget>[
    DashBoardShopOwnerScreen(),
    WalletScreen(),
    SettingScreen()
  ];

  void _onItemTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _widgetOptions.elementAt(selectedIndex.value),
        bottomNavigationBar: Container(
          height: 8.5.h,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: borderColor,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ]),
          child: BottomNavigationBar(
            elevation: 0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: getSvgImage(
                  'dashboard_icon.svg',
                ),
                label: 'Dashboard'.tr,
                activeIcon: getSvgImage(
                  'fill_dashboard_icon.svg',
                ),
              ),
              BottomNavigationBarItem(
                icon: getSvgImage(
                  'wallet_icon.svg',
                ),
                label: 'Wallet'.tr,
                activeIcon: getSvgImage(
                  'fill_wallet_icon.svg',
                ),
              ),
              BottomNavigationBarItem(
                icon: getSvgImage(
                  'settings_icon.svg',
                ),
                label: 'Settings'.tr,
                activeIcon: getSvgImage(
                  'fill_settings_icon.svg',
                ),
              ),
            ],
            currentIndex: selectedIndex.value,
            selectedItemColor: accentColor,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
