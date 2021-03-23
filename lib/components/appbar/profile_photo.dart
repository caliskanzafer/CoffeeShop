import 'package:coffee_shop/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/constants/size_constant.dart';

class ProfilePhoto extends StatelessWidget {
  final String imageURL;

  const ProfilePhoto({
    Key key,
    @required this.imageURL,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: context.dynamicSize(0.05),
      backgroundColor: ColorConstant().profilePictureBorder,
      child: CircleAvatar(
        radius: context.dynamicSize(0.045),
        backgroundImage: NetworkImage('$imageURL'),
      ),
    );
  }
}
