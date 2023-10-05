import 'package:flutter/material.dart';
import '../util/colors.dart';
import '../util/custom_fonts.dart';

ThemeData light = ThemeData(
  scaffoldBackgroundColor: ColorResources.whiteColor,
  fontFamily: 'Rubic',
  brightness: Brightness.light,
  primaryColor: const Color(0xFFFFFFFF),
  highlightColor: const Color(0xFFFFFFFF),
  appBarTheme: AppBarTheme(
    backgroundColor: ColorResources.whiteColor,
    centerTitle: true,
    elevation: 1,
    titleTextStyle: heading2Bold.copyWith(
      color: ColorResources.primaryColor,
    ),
  ),
);