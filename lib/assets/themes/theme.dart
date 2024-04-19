import 'package:havo_ilmiy/assets/colors/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData theme() => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(color: Colors.white),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        unselectedWidgetColor: Colors.black,
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.grey),
        ),
        textTheme: const TextTheme(
          displayLarge: headline1,
          displayMedium: headline2,
          displaySmall: headline3,
          headlineMedium: headline4,
          headlineSmall: headline5,
          titleLarge: headline6,
          bodyLarge: bodyText1,
          bodyMedium: bodyText2,
          titleMedium: subTitle1,
          titleSmall: subTitle2,
          bodySmall: caption,
          labelLarge: button,
          labelSmall: overline,
        ),
        colorScheme: const ColorScheme(
          background: Colors.white,
          brightness: Brightness.light,
          primary: Colors.blue,
          secondary: Colors.green,
          error: Colors.red,
          surface: Colors.blue,
          onPrimary: Colors.white,
          onSecondary: Colors.green,
          onBackground: Colors.white,
          onError: Colors.red,
          onSurface: Colors.white,
        ),
      );

  // Fonts
  static const headline1 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: Colors.black87,
  );
  static const headline2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.black87,
  );
  static const headline3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
  );
  static const headline4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );
  static const headline5 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.blue,
  );
  static const headline6 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );
  static const bodyText1 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const bodyText2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.blue,
  );

  static const subTitle1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
  );

  static const subTitle2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.blueAccent,
  );

  static const caption = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: Colors.blue,
  );

  static const button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const overline = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.green,
  );
}
