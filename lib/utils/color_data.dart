import 'dart:ui';

Color accentColor = "#3E13AA".toColor();
Color pinkAppColor = "#F10062".toColor();
Color borderColor = "#E8ECF4".toColor();
Color blackColor = "#000000".toColor();
Color backgroundColor = "#FFFFFF".toColor();
Color textBlackColor = "#1E1E1E".toColor();
Color textWhiteColor = "#FFFFFF".toColor();
Color subTextColor = "#999EA1".toColor();
Color skyBlueTextColor = "#35C2C1".toColor();
Color hintTextColor = "#1F1F1F6E".toColor();
Color forgotPasswordColor = "#FB344F".toColor();
Color skipBDColor = "#F5F5F5".toColor();
Color bottomBarIconColor = "#6D6E71".toColor();
Color inactiveSliderColor = "#D9D9D9".toColor();
Color feePayCardColor = "#C9DEFA".toColor();
Color backCardColor = "#EAF2FF".toColor();
Color redColor = "#F20707".toColor();
Color greenColor = "#0A9555".toColor();
Color orangeColor = "#F68C25".toColor();
Color lightGreenColor = "#60BF84".toColor();
Color blue = "#26E0E7".toColor();
Color lightblue = "#CFEAFF".toColor();
Color lightpink = "#FFACD4".toColor();

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
