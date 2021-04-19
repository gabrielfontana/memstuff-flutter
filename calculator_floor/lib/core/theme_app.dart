import 'package:flutter/material.dart';

import 'constants.dart';

final kAppTheme = ThemeData(
  primarySwatch: Colors.green,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  buttonTheme: ButtonThemeData(
    height: kButtonHeight,
    textTheme: ButtonTextTheme.primary,
  ),
);
