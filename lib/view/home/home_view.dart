import 'dart:math';

import 'package:coffee_shop/components/appBar/profile_photo.dart';
import 'package:coffee_shop/components/appBar/search_button.dart';
import 'package:coffee_shop/components/home/sized_box.dart';
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
  var _currentPageIndex = NavBottomMenuPages.HOME;
  var _currentCategoryIndex = Categories.RECENT_ORDER;
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
              Padding(
                padding: EdgeInsets.all(context.dynamicSize(0.007)),
                child: Column(
                  children: [
                    _categoriesBox(
                        'Recent Orders',
                        _currentCategoryIndex == Categories.RECENT_ORDER
                            ? true
                            : false,
                        Categories.RECENT_ORDER),
                    CustomSizedBox(
                      height: 0.06,
                    ),
                    _categoriesBox(
                        'Tea',
                        _currentCategoryIndex == Categories.TEA ? true : false,
                        Categories.TEA),
                    CustomSizedBox(
                      height: 0.06,
                    ),
                    _categoriesBox(
                        'Coffee',
                        _currentCategoryIndex == Categories.COFFEE
                            ? true
                            : false,
                        Categories.COFFEE),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
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

  GestureDetector _categoriesBox(String text, bool isSelected, var index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentCategoryIndex = index;
        });
      },
      child: RotatedBox(
        quarterTurns: 3,
        child: RichText(
            text:
                TextSpan(text: '$text', style: context.categories(isSelected))),
      ),
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
              selected:
                  _currentPageIndex == NavBottomMenuPages.HOME ? true : false,
              index: NavBottomMenuPages.HOME),
          iconButton(
              iconData: Icons.tag,
              selected:
                  _currentPageIndex == NavBottomMenuPages.BUY ? true : false,
              index: NavBottomMenuPages.BUY),
          iconButton(
              iconData: Icons.shopping_cart,
              selected:
                  _currentPageIndex == NavBottomMenuPages.CART ? true : false,
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
          _currentPageIndex = index;
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
