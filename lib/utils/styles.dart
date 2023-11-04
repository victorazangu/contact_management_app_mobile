import 'package:flutter/material.dart';

import 'defaultValues.dart';

abstract class ThemeStyling {
  static const regular_14 = TextStyle(fontFamily: 'Regular', fontSize: 14);

  static const medium_20 = TextStyle(
      fontFamily: 'Medium', color: DefaultValues.textColor, fontSize: 20);

  static const medium_20_dark = TextStyle(
      fontFamily: 'Medium',
      color: DefaultValues.mainBackgroundColor,
      fontSize: 20);

  static const medium_24 = TextStyle(
      fontFamily: 'Medium',
      color: DefaultValues.mainPrimaryColor,
      fontSize: 24);
  static const bold_20 = TextStyle(
      fontFamily: 'Bold', color: DefaultValues.textColor, fontSize: 20);
}
