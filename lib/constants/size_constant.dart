import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double dynamicWidth(double value) => MediaQuery.of(this).size.width * value;
  double dynamicHeight(double value) => MediaQuery.of(this).size.height * value;
  double dynamicSize(double value) => MediaQuery.of(this).size.height * value;
}
