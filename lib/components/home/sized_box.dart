import 'package:flutter/material.dart';
import 'package:coffee_shop/constants/size_constant.dart';

class CustomSizedBox extends StatelessWidget {
  final double height;
  final double width;

  const CustomSizedBox({Key key, this.height, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height == null
          ? context.dynamicHeight(0)
          : context.dynamicHeight(height),
      width:
          width == null ? context.dynamicWidth(0) : context.dynamicWidth(width),
    );
  }
}
