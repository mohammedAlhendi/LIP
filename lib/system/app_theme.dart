import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color mainColorLight = Color.fromRGBO(0, 119, 183, 0.2),
      mainColor = Color.fromRGBO(185, 166, 100, 1),
      mainColorGreen = Color.fromRGBO(185, 166, 100, 1),
      mainColorGreenLight = Color.fromRGBO(247, 198, 132, 1),
      mainColorWhite = Color.fromRGBO(252, 252, 250, 1),
      mainColorDialog = Color.fromRGBO(84, 70, 25, 1),
      mainColorGrey = Color.fromRGBO(119, 119, 119, 1),
      mainColorHeaderTab2 = Color.fromRGBO(233, 233, 233, 1),
      mainColorGreylight = Colors.grey,
      mainColorBlueOTP = Color.fromRGBO(26, 58, 177, 1),
      mainColorGreyDark = Color.fromRGBO(91, 91, 91, 1),
      mainColorGreyDarkDark = Color.fromRGBO(68, 68, 68, 1),
      mainColorRed = Color.fromRGBO(216, 36, 43, 1),
      mainColorTransparent = Colors.transparent,
      mainColorNotWhite = Color(0xFFFEFEFE),
      mainColorBlack = Colors.black,
      mainColorPurple = Colors.purple,
      mainColorNearlyBlue = Colors.blue,
      mainColorBlueAccent = Colors.blueAccent,
      mainColorBlueLight = Color.fromRGBO(232, 240, 254, 1),
      mainColorYellow = Colors.yellow,
      mainColorOrange = Colors.orange,
      mainDeactivatedText = Color(0xFF767676),
      mainDismissibleBackground = Color(0xFF364A54),
      mainChipBackground = Color(0xFFEEF1F3),
      mainColorNafadh = Color.fromRGBO(236, 237, 242, 1),
      mainColorNafadhDark = Color.fromRGBO(17, 153, 142, 1),
      mainSpacer = Color(0xFFF2F2F2),
      mainColorAppBar = Color.fromRGBO(250, 242, 240, 1),
      mainColorSplash = Color.fromRGBO(229, 67, 34, 1);

  static LinearGradient mainLinearGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [mainColorWhite, mainColor],
  );
  static LinearGradient mainLinearGradient2 = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [mainColorWhite, mainColor],
  );
  static LinearGradient mainLinearGradient3 = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [mainColorWhite, mainColor],
  );
}
