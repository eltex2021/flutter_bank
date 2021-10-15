import 'package:flutter/material.dart';

abstract class MySnackBar {
  static SnackBar mySnackBar = SnackBar(
      elevation: 30,
      behavior: SnackBarBehavior.floating,
      width: 230,
      backgroundColor: Colors.grey[800]!.withOpacity(0.8),
      duration: const Duration(milliseconds: 1000),
      content: const Text(
        'Аккаунт создан',
        textAlign: TextAlign.center,
        style: TextStyle(),
      ));

  static SnackBar mySnackBar1 = SnackBar(
      elevation: 30,
      behavior: SnackBarBehavior.floating,
      width: 230,
      backgroundColor: Colors.grey[800]!.withOpacity(0.8),
      duration: const Duration(milliseconds: 1000),
      content: const Text(
        'Аккаунт с этим адресом уже существует',
        textAlign: TextAlign.center,
        style: TextStyle(),
      ));

  static SnackBar mySnackBar2 = SnackBar(
      elevation: 30,
      behavior: SnackBarBehavior.floating,
      width: 230,
      backgroundColor: Colors.grey[800]!.withOpacity(0.8),
      duration: const Duration(milliseconds: 1000),
      content: Container(
          child: const Text(
        'Регистрация не удалась',
        textAlign: TextAlign.center,
        style: TextStyle(),
      )));

  static SnackBar mySnackBar3 = SnackBar(
      elevation: 30,
      behavior: SnackBarBehavior.floating,
      width: 230,
      backgroundColor: Colors.grey[800]!.withOpacity(0.8),
      duration: const Duration(milliseconds: 1000),
      content: const Text(
        'Авторизация не удалась',
        textAlign: TextAlign.center,
        style: TextStyle(),
      ));

  static SnackBar mySnackBar4 = SnackBar(
      elevation: 30,
      behavior: SnackBarBehavior.floating,
      width: 230,
      backgroundColor: Colors.grey[800]!.withOpacity(0.8),
      duration: const Duration(milliseconds: 1000),
      content: const Text(
        'Неверный логин или пароль',
        textAlign: TextAlign.center,
        style: TextStyle(),
      ));

  static SnackBar mySnackBar5 = SnackBar(
      elevation: 30,
      behavior: SnackBarBehavior.floating,
      width: 230,
      backgroundColor: Colors.grey[800]!.withOpacity(0.8),
      duration: const Duration(milliseconds: 1000),
      content: const Text(
        'Неверный логин',
        textAlign: TextAlign.center,
        style: TextStyle(),
      ));

  static SnackBar mySnackBar6 = SnackBar(
      elevation: 30,
      behavior: SnackBarBehavior.floating,
      width: 230,
      backgroundColor: Colors.grey[800]!.withOpacity(0.8),
      duration: const Duration(milliseconds: 1000),
      content: const Text(
        'Для восстановления пароля введите email',
        textAlign: TextAlign.center,
        style: TextStyle(),
      ));

  static SnackBar mySnackBar7 = SnackBar(
      elevation: 30,
      behavior: SnackBarBehavior.floating,
      width: 230,
      backgroundColor: Colors.grey[800]!.withOpacity(0.8),
      duration: const Duration(milliseconds: 1000),
      content: const Text(
        'Отправлено на указанный email',
        textAlign: TextAlign.center,
        style: TextStyle(),
      ));
}
