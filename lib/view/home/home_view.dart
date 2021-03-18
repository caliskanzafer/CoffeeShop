import 'package:flutter/material.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.orange,
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1142210684001955840/TFSLLVDU_400x400.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
