import 'package:flutter/material.dart';

import 'color_constant.dart';

extension TextStyleExtension on BuildContext {
  get baslik => Theme.of(this)
      .textTheme
      .headline4
      .copyWith(color: ColorConstant().headline, fontFamily: 'AbrilFatface');
}
