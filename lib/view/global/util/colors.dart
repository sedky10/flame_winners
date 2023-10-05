import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/providers/theme_provider.dart';

class ColorResources {
  static Color getBackground(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? bailColor
        : whiteColor;
  }
  static Color getContainerColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? whiteColor.withOpacity(.20)
        : whiteColor;
  }
  static Color getTextFieldTextColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? bailColor
        : greyColor;
  }

  static Color getTextFieldBackground(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? orangeLightColor
        : greyLightColor;
  }

  static Color getTextColor1(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? whiteColor
        : orangeNormalColor;
  }
  static Color getTextColor2(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? orangeLightColor
        : bailColor;
  }static Color getAppBarTextColor2(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? orangeLightColor
        :  orangeNormalColor;
  }


  static Color getIconColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? orangeLightColor
        : whiteColor ;

  }

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color bailColor = Color(0xFF0f0501);
  static const Color bailColor2 = Color(0xFF170702);
  static const Color orangeNormalColor = Color(0xFFba3b0a);
  static const Color orangeLightColor = Color(0xFFFFE9B9);
  static const Color greyLightColor = Color(0xFFF0F0F0);
  static const Color greyColor = Colors.grey;
  static const Color blackColor = Colors.black;
}