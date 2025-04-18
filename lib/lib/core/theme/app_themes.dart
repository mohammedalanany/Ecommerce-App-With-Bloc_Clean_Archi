import 'package:flutter/material.dart';

ThemeData theme(BuildContext context, String language) {
  return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF037979),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: language == 'ar' ? 'Nunito' : 'Nunito',

      // accentColor: Color(0xFFD18332),
      primaryColor: Color(0xFF037979),
      //  date picker color
      colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Color(0xFF037979),
          ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF000000)),
        titleTextStyle: TextStyle(
            fontSize: 15,
            fontFamily: language == 'ar' ? 'Nunito' : 'Nunito',
            color: Color(0xFF000000),
            fontWeight: FontWeight.w500),
      ));
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
  );
}
