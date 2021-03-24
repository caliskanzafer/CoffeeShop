import 'package:flutter/material.dart';

import 'color_constant.dart';
import 'package:coffee_shop/constants/size_constant.dart';

extension TextStyleExtension on BuildContext {
  get baslik => Theme.of(this)
      .textTheme
      .headline4
      .copyWith(color: ColorConstant().headline, fontFamily: 'AbrilFatface');

  categories(bool selected) => Theme.of(this).textTheme.headline4.copyWith(
      color: selected
          ? ColorConstant().menuEnableColor
          : ColorConstant().menuDisableColor,
      fontFamily: 'OpenSans',
      fontSize: this.dynamicSize(0.03));
}
