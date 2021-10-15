import 'package:flutter/material.dart';

import 'color_theme.dart';

abstract class AppTexsts {
  static const welcome = TextStyle(
    color: AppColors.blue_main,
    fontSize: 40,
    letterSpacing: 0.5,
    height: 1.176,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );

  static const login = TextStyle(
    color: Colors.white,
    fontSize: 15,
    letterSpacing: 0.5,
    height: 1.176,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
  static const forgot = TextStyle(
    color: AppColors.blue_main,
    fontSize: 14,
    letterSpacing: 0.5,
    height: 1.176,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );
}
