import 'package:flutter/material.dart';

import 'color_theme.dart';

abstract class AppTexsts {
  static const welcome = TextStyle(
    color: AppColors.blueMain,
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
  static const white24 = TextStyle(
    color: Colors.white,
    fontSize: 24,
    letterSpacing: 0.5,
    height: 1.176,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
  static const forgot = TextStyle(
    color: AppColors.blueMain,
    fontSize: 14,
    letterSpacing: 0.5,
    height: 1.176,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );
  static const chipText = TextStyle(
    color: AppColors.blueMain,
    fontSize: 16,
    letterSpacing: 0.5,
    height: 1.176,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  static const text12Grey = TextStyle(
    color: AppColors.greyMain,
    fontSize: 12,
    letterSpacing: 0.5,
    height: 1.33,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
  static const text22Black = TextStyle(
    color: AppColors.blackText,
    fontSize: 22,
    letterSpacing: 0.5,
    height: 1.33,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
  static const text12grey2 = TextStyle(
    color: AppColors.greyText,
    fontSize: 12,
    letterSpacing: 0.5,
    height: 1.33,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
}
