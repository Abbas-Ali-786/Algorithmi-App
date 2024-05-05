import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../utils/color_data.dart';
import '../../utils/constant.dart';

Widget getVerSpace(double verSpace) {
  return SizedBox(
    height: verSpace,
  );
}

Widget getHorSpace(double verSpace) {
  return SizedBox(
    width: verSpace,
  );
}

Widget getAssetImage(String image,
    {double? width,
    double? height,
    Color? color,
    double? scale,
    BoxFit boxFit = BoxFit.contain}) {
  return Image.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
    scale: scale,
  );
}

Widget getSvgImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return SvgPicture.asset(
    Constant.svgImagePath + image,
    width: width,
    height: height,
    fit: boxFit,
  );
}

getWhiteColorStatusBar() {
  return AppBar(
    backgroundColor: backgroundColor,
    toolbarHeight: 0,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: backgroundColor,
        statusBarColor: backgroundColor,
        statusBarIconBrightness: Brightness.dark),
  );
}

getAppBar({leading, actions, text}) {
  return AppBar(
    backgroundColor: accentColor,
    toolbarHeight: 10.h,
    elevation: 0,
    centerTitle: true,
    leading: leading,
    actions: [Padding(padding: EdgeInsets.only(right: 2.3.h), child: actions)],
    title: getCustomTextW6S20(text: text, color: backgroundColor),
  );
}

Widget getCustomTextW6S12({text, color, textAlign}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.left,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 12.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getMartTitle({text, color, maxLines}) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines ?? 1,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: 12.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getMartTitleDetails({text, color}) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: 16.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S9({text, color}) {
  return Text(
    text,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 9.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S10({text, color}) {
  return Text(
    text,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 10.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S15({text, color, textAlign,maxLines}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    style: TextStyle(
      overflow: TextOverflow.ellipsis,
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 15.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S17({text, color, textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 17.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S20({text, color}) {
  return Text(
    text,
    maxLines: 1,

    style: TextStyle(
      color: color,
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w600,
      fontSize: 20.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S16({text, color, textAlign,maxLines}) {
  return Text(
    text,
    maxLines: maxLines,
    textAlign: textAlign ?? TextAlign.center,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 16.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S22({text, color, textAlign}) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
    textAlign: textAlign ?? TextAlign.center,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 22.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

Widget getCustomTextW6S36({text, color}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w800,
      fontSize: 36.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}
Widget getCustomTextW6S30({text, color}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w800,
      fontSize: 30.px,
      fontFamily: Constant.fontsFamily,
    ),
  );
}

getCustomTextStyleW5S15({color}) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.w500,
    fontFamily: Constant.fontsFamily,
    fontSize: 15.px,
  );
}

getCustomTextStyleW4S13({color}) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.w400,
    fontFamily: Constant.fontsFamily,
    fontSize: 13.px,
  );
}

getCustomTextStyleW7S15({color}) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.w700,
    fontFamily: Constant.fontsFamily,
    fontSize: 15.px,
  );
}

getCustomTextStyleW10S13({color}) {
  return TextStyle(
    color: color,
    fontWeight: FontWeight.bold,
    fontFamily: Constant.fontsFamily,
    fontSize: 13.px,
  );
}

Widget getCustomTextFormField(
    {controller,
    validator,
    hintText,
    suffixIcon,
    obscureText,
    keyboardType,
    prefixIcon,
    onTap,
    readOnly,
    suffixIconConstraintsWidth,
    onChanged}) {
  return TextFormField(
    keyboardType: keyboardType,
    obscureText: obscureText ?? false,
    cursorColor: textBlackColor,
    controller: controller,
    validator: validator,
    onTap: onTap,
    onChanged: onChanged,
    readOnly: readOnly ?? false,
    style: getCustomTextStyleW5S15(
      color: textBlackColor,
    ),
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0.px),
          borderRadius: BorderRadius.circular(10.0.px)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0.px),
          borderRadius: BorderRadius.circular(10.0.px)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0.px)),
      contentPadding: EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 1.3.h),
      suffixIconConstraints: BoxConstraints.tightFor(
          width: suffixIconConstraintsWidth ?? 6.0.h, height: 2.5.h),
      suffixIcon: suffixIcon,
      prefixIconConstraints:
          BoxConstraints.tightFor(width: 7.0.h, height: 3.5.h),
      prefixIcon: prefixIcon,
      isCollapsed: true,
      filled: true,
      fillColor: backgroundColor,
      hintText: hintText,
      hintStyle: getCustomTextStyleW5S15(
        color: textBlackColor,
      ),
      enabled: true,
    ),
  );
}

Widget fillColorButton({text, color, paddingVertical}) {
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: paddingVertical ?? 1.2.h),
    decoration: BoxDecoration(
        color: color ?? accentColor,
        borderRadius: BorderRadius.all(Radius.circular(10.px)),
        border: Border.all(color: color ?? accentColor, width: 1.px)),
    child: getCustomTextW6S16(
      text: text,
      color: textWhiteColor,
    ),
  );
}

Widget timerButton({text}) {
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(horizontal: 5.h),
    padding: EdgeInsets.symmetric(vertical: 0.5),
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10.px)),
        border: Border.all(color: backgroundColor, width: 1.px)),
    child: getCustomTextW6S36(
      text: text,
      color: pinkAppColor,
    ),
  );
}

Widget outlineColorButton({text, color, borderColor}) {
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: 3.7.h),
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(18.px)),
        border: Border.all(color: borderColor, width: 1.px)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getCustomTextW6S20(
          text: text,
          color: textWhiteColor,
        ),
        getHorSpace(2.h),
        Icon(
          Icons.arrow_right_outlined,
          color: backgroundColor,
        )
      ],
    ),
  );
}

Widget outlineButton({text, textColor, color, borderColor, paddingVertical}) {
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: paddingVertical ?? 1.6.h),
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10.px)),
        border: Border.all(color: borderColor, width: 1.px)),
    child: getCustomTextW6S16(
      text: text,
      color: textColor ?? borderColor,
    ),
  );
}

// class ExpentionCard extends StatelessWidget {
//   dynamic heading, subheading;
//
//   ExpentionCard({this.heading, this.subheading});
//
//   @override
//   Widget build(BuildContext context) {
//     return ExpandableNotifier(
//         child: Column(
//       children: <Widget>[
//         ScrollOnExpand(
//           scrollOnExpand: true,
//           scrollOnCollapse: false,
//           child: ExpandablePanel(
//             theme: const ExpandableThemeData(
//                 headerAlignment: ExpandablePanelHeaderAlignment.center,
//                 tapBodyToCollapse: true,
//                 hasIcon: false,
//                 tapHeaderToExpand: false,
//                 crossFadePoint: 20),
//             header: getCustomTextW6S12(text: heading, color: subTextColor),
//             collapsed: Text(
//               subheading,
//               softWrap: true,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                 color: textBlackColor,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 12.px,
//                 fontFamily: Constant.fontsFamily,
//               ),
//             ),
//             expanded: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 for (var _ in Iterable.generate(1))
//                   Text(
//                     subheading,
//                     softWrap: true,
//                     overflow: TextOverflow.fade,
//                     style: TextStyle(
//                       color: textBlackColor,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 12.px,
//                       fontFamily: Constant.fontsFamily,
//                     ),
//                   ),
//               ],
//             ),
//             builder: (_, collapsed, expanded) {
//               return Expandable(
//                 collapsed: collapsed,
//                 expanded: expanded,
//                 theme: const ExpandableThemeData(fadeCurve: Curves.bounceInOut),
//               );
//             },
//           ),
//         ),
//         if (subheading.toString().length >= 60)
//           Align(
//             alignment: Alignment.centerRight,
//             child: Builder(
//               builder: (context) {
//                 var controller =
//                     ExpandableController.of(context, required: true);
//                 return GestureDetector(
//                   onTap: () {
//                     controller.toggle();
//                   },
//                   child: Text(
//                     controller!.expanded ? "Read Less".tr : "Read More".tr,
//                     style: TextStyle(color: textBlackColor, fontSize: 10.px),
//                   ),
//                 );
//               },
//             ),
//           ),
//       ],
//     ));
//   }
// }

MaterialBanner showMaterialBanner(BuildContext context,
    {title, subTitle, onTapToCartScreen}) {
  return MaterialBanner(
      content: getCustomTextW6S12(text: title, color: accentColor),
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      backgroundColor: backCardColor,
      actions: [
        GestureDetector(
            onTap: onTapToCartScreen,
            child: getCustomTextW6S12(text: subTitle, color: skyBlueTextColor)),
      ]);
}

Widget settingFirstCard({icon, title, subTitle, arrowColor}) {
  return Container(
    height: 7.h,
    padding: EdgeInsets.symmetric(horizontal: 2.h),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(10.px)),
      boxShadow: [
        BoxShadow(
          color: borderColor,
          blurRadius: 2,
          offset: const Offset(0, 0), // changes position of shadow
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 5.h, child: getSvgImage(icon, height: 3.h)),
            getHorSpace(1.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getCustomTextW6S15(text: title, color: textBlackColor),
                getCustomTextW6S12(text: subTitle, color: subTextColor),
              ],
            ),
          ],
        ),
        Icon(Icons.arrow_forward_ios_rounded,
            color: arrowColor ?? skyBlueTextColor, size: 2.h),
      ],
    ),
  );
}
Widget personalInfoCard({ title, subTitle}) {
  return Container(
    height: 7.h,
    width: 100.w,
    padding: EdgeInsets.symmetric(horizontal: 2.5.h),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(10.px)),
      boxShadow: [
        BoxShadow(
          color: borderColor,
          blurRadius: 2,
          offset: const Offset(0, 0), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getCustomTextW6S15(text: title, color: textBlackColor),
        getCustomTextW6S12(text: subTitle, color: subTextColor),
      ],
    ),
  );
}

Widget settingCard({icon, title, arrowColor}) {
  return Container(
    height: 7.h,
    padding: EdgeInsets.symmetric(horizontal: 2.h),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(10.px)),
      boxShadow: [
        BoxShadow(
          color: borderColor,
          blurRadius: 2,
          offset: const Offset(0, 0), // changes position of shadow
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 5.h,child: getSvgImage(icon, height: 3.h)),
            getHorSpace(1.h),
            getCustomTextW6S15(text: title, color: subTextColor),
          ],
        ),
        Icon(Icons.arrow_forward_ios_rounded,
            color: arrowColor ?? skyBlueTextColor, size: 2.h),
      ],
    ),
  );
}

Widget signOutButton() {
  return Container(
    width: double.infinity,
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: 1.1.h),
    decoration: BoxDecoration(
        color: pinkAppColor,
        borderRadius: BorderRadius.all(Radius.circular(10.px)),
        border: Border.all(color: pinkAppColor, width: 1.px)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getSvgImage('signout_icon.svg', height: 4.h),
        getHorSpace(2.h),
        getCustomTextW6S16(text: 'Sign Out'.tr, color: textWhiteColor)
      ],
    ),
  );
}
