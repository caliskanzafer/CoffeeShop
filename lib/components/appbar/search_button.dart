import 'package:coffee_shop/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/constants/size_constant.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      color: ColorConstant().searchIconColor,
      iconSize: context.dynamicSize(0.04),
      icon: Icon(
        Icons.search_sharp,
      ),
    );
  }
}
