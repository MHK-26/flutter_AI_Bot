import 'package:ai_bot/constants/constants.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color(0xffffffff),
    primary: Color(0xff3369ff),
    secondary: Color(0xffffffff),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(color: Color(0xff000000)),
    titleSmall: TextStyle(color: Color(0xffeeeeee)),
    bodyMedium:
        TextStyle(color: Color(0xff000000), fontSize: FontSized.standard),
    bodySmall: TextStyle(color: Color(0xff000000), fontSize: FontSized.small),
  ),
);
ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      surface: Color(0xff000000),
      primary: Color(0xff3369ff),
      secondary: Color(0xffffffff),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Color(0xffeeeeee)),
      titleSmall: TextStyle(color: Color(0xff000000)),
      bodyMedium:
          TextStyle(color: Color(0xffeeeeee), fontSize: FontSized.standard),
      bodySmall: TextStyle(color: Color(0xff000000), fontSize: FontSized.small),
    ));
