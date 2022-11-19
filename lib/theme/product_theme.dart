import 'package:flutter/material.dart';

class ProductTheme {
  static ThemeData darkTheme = ThemeData.dark( ).copyWith(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
    ),
  );
}
