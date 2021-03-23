import 'package:coffee_shop/components/appBar/profile_photo.dart';
import 'package:coffee_shop/components/appBar/search_button.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/constants/size_constant.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          child: Stack(
            children: [
              Positioned(
                  top: context.dynamicHeight(0.04),
                  left: context.dynamicWidth(0.06),
                  child: ProfilePhoto(
                    imageURL:
                        'https://pbs.twimg.com/profile_images/1142210684001955840/TFSLLVDU_400x400.jpg',
                  )),
              Positioned(
                top: context.dynamicHeight(0.06),
                right: context.dynamicWidth(0.06),
                child: SearchButton(),
              ),
            ],
          ),
          preferredSize: Size.fromHeight(context.dynamicSize(0.12)),
        ),
        body: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
