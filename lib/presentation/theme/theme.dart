import 'package:academic_master/presentation/utils/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Apptheme {
  final BuildContext context;
  Apptheme(this.context);

  static const backgroundColor = Color(0xffffffff);
  static const primaryColor = Color(0xff2BB5F3);
  static const lightCardColor = Color(0xffF3F3F3);

  static const secondaryColor = Color(0xffD8EAF2);
  static const assentColor = Color(0xff253157);
  static const black = Colors.black;

  static const lightColor = Color.fromRGBO(
    142,
    142,
    142,
    0.5,
  );

  TextStyle boldText = GoogleFonts.poppins(
    color: assentColor,
    fontWeight: FontWeight.w500,
  );
  TextStyle thinText = GoogleFonts.poppins(
    color: assentColor,
    fontWeight: FontWeight.w100,
  );
  TextStyle normalText = GoogleFonts.poppins(
    color: assentColor,
    fontWeight: FontWeight.w300,
  );
  TextStyle lightboldText = GoogleFonts.poppins(
    color: assentColor,
    fontWeight: FontWeight.w400,
  );

  static ThemeData theme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: RotationFadeTransitionBuilder(),
      },
    ),
    primaryTextTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 10,
        color: Colors.red,
      ),
      bodyText2: TextStyle(
        fontSize: 5,
        color: Colors.red,
      ),
    ),
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: "Circular_Bold",
    buttonTheme: const ButtonThemeData(
      buttonColor: assentColor,
      padding: EdgeInsets.symmetric(vertical: 20),
      minWidth: double.maxFinite,
      colorScheme: ColorScheme.light(brightness: Brightness.dark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          primaryColor,
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 20,
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(
            34,
            50,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor,
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 20,
            fontFamily: "Circular",
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(
            34,
            50,
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 3,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
      ),
      color: backgroundColor,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: Colors.black,
        opacity: 18,
        size: 25,
      ),
    ),
    toggleableActiveColor: primaryColor,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
      labelStyle: TextStyle(
        color: Color(0xff253157),
      ),
      hintStyle: TextStyle(
        color: Color(0xff253157),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
  );
}
