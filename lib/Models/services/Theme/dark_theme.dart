import 'package:tour_destiny/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: darkGrey,
  // actionIconTheme: ActionIconThemeData(),
  iconTheme: IconThemeData(
    color: whiteColor,
  ),
  shadowColor: greyColor,
  cardTheme: CardTheme(color: darkGrey, shadowColor: greyColor),
  // backgroundColor: darkGrey,
  bottomAppBarColor: Colors.grey[700],
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: greyColor),
  datePickerTheme: DatePickerThemeData(backgroundColor: greyColor),
  indicatorColor: primaryColor,
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
        iconColor: MaterialStateProperty.all(darkGrey),
        backgroundColor: MaterialStateProperty.all(greyColor)),
  ),
  primaryColorDark: darkGrey,
  primaryTextTheme: TextTheme(
    // Body text color
    bodyMedium: TextStyle(color: Colors.white, fontSize: 12),
    //  Button text color
  ),
  primaryColor: primaryColor, // Dark background color
  appBarTheme: AppBarTheme(
      color: Color(0xff303131), // Appbar color
      iconTheme: IconThemeData(color: Colors.white),
      foregroundColor: Colors.white // Icon color

      ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xff303131), // BottomNavBar color
    selectedItemColor: primaryColor, // Selected item color
    unselectedItemColor: Colors.grey[400], // Unselected item color
  ),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: primaryColor // FAB color
          ),
  buttonTheme: ButtonThemeData(
    buttonColor: primaryColor, // Button color
    textTheme: ButtonTextTheme.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: primaryColor),
    // Change the border color for all InputDecorations
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.white,
          width: 1,
        )),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: primaryColor, // Change this color to the desired color
        width: 1.0, // Change the border width if needed
      ),
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontSize: 14), // Body text color
    bodyMedium: TextStyle(color: Colors.white, fontSize: 12),
    bodySmall: TextStyle(color: Colors.white, fontSize: 10),
    titleMedium: TextStyle(color: Colors.white, fontSize: 12), // Subtitle color
    titleSmall: TextStyle(color: Colors.white, fontSize: 10),
    titleLarge: TextStyle(color: Colors.white, fontSize: 14),
    labelMedium: TextStyle(
        color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(color: Colors.white, fontSize: 10),

    labelLarge:
        TextStyle(color: Colors.white, fontSize: 14), // Button text color
  ),
);
