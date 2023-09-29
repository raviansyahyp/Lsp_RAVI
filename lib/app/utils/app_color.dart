import 'package:flutter/material.dart';

class AppColor {
  static LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, Color(0xff1e3873)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static Color primaryColor = Color.fromARGB(255, 0, 119, 255);
  static Color primarySoft = Color(0xff004AAD);
  static Color primaryExtraSoft = Color(0xFFEFF3FC);
  static Color secondary = Color(0xFFCB8C9B);
  static Color secondarySoft = Color(0xFF9D9D9D);
  static Color secondaryExtraSoft = Color(0xFFE9E9E9);
  static Color warning = Color.fromARGB(255, 255, 109, 24);
  static Color dark = Color.fromARGB(255, 53, 53, 52);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}
