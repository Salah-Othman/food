import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  // الانتقال لصفحة جديدة
  void push(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  // الرجوع للخلف
  void pop() => Navigator.of(this).pop();

  // الانتقال لصفحة ومسح اللي فات (للـ Login مثلاً)
  void pushAndRemoveUntil(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName, (route) => false, arguments: arguments);
  }
}