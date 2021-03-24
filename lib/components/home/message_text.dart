import 'package:flutter/material.dart';
import 'package:coffee_shop/constants/text_style_constant.dart';

class CustomMessageText extends StatelessWidget {
  final String message;

  const CustomMessageText({Key key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      '$message',
      style: context.baslik,
    );
  }
}
