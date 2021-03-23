import 'dart:math';

import 'package:coffee_shop/components/appBar/profile_photo.dart';
import 'package:coffee_shop/components/appBar/search_button.dart';
import 'package:coffee_shop/constants/color_constant.dart';
import 'package:coffee_shop/constants/text_style_constant.dart';
import 'package:coffee_shop/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/constants/size_constant.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _currentIndex = NavBottomMenuPages.HOME;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant().backgroundColor,
      appBar: _appBar(context),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning,',
                style: context.baslik,
              ),
              Text(
                'Zafer!',
                style: context.baslik,
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                    child: Transform.rotate(
                      angle: pi / -2,
                      child: Text('hello'),
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    color: Colors.green,
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.amber,
                  width: double.infinity,
                  height: 300,
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: navBarMenu(context),
    );
  }

  Container navBarMenu(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.11),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorConstant().navBarShadow,
            blurRadius: 10,
          )
        ],
        color: ColorConstant().backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          iconButton(
              iconData: Icons.blur_circular,
              selected: _currentIndex == NavBottomMenuPages.HOME ? true : false,
              index: NavBottomMenuPages.HOME),
          iconButton(
              iconData: Icons.tag,
              selected: _currentIndex == NavBottomMenuPages.BUY ? true : false,
              index: NavBottomMenuPages.BUY),
          iconButton(
              iconData: Icons.shopping_cart,
              selected: _currentIndex == NavBottomMenuPages.CART ? true : false,
              index: NavBottomMenuPages.CART),
        ],
      ),
    );
  }

  IconButton iconButton({IconData iconData, bool selected, var index}) {
    return IconButton(
      icon: Icon(
        iconData,
        color: selected
            ? ColorConstant().menuEnableColor
            : ColorConstant().menuDisableColor,
        size: 30,
      ),
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  PreferredSize _appBar(BuildContext context) {
    return PreferredSize(
      child: Stack(
        children: [
          Positioned(
              top: context.dynamicHeight(0.06),
              left: context.dynamicWidth(0.08),
              child: ProfilePhoto(
                imageURL:
                    'https://pbs.twimg.com/profile_images/1142210684001955840/TFSLLVDU_400x400.jpg',
              )),
          Positioned(
            top: context.dynamicHeight(0.08),
            right: context.dynamicWidth(0.06),
            child: SearchButton(),
          ),
        ],
      ),
      preferredSize: Size.fromHeight(context.dynamicSize(0.13)),
    );
  }
}
