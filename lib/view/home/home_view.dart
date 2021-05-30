import 'package:coffee_shop/constants/color_constant.dart';
import 'package:coffee_shop/core/service/urunler_service.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/constants/size_constant.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  UrunService urunService;

  @override
  void initState() {
    super.initState();
    urunService = UrunService();
  }

  @override
  Widget build(BuildContext context) {
    final double itemHeight =
        (MediaQuery.of(context).size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = MediaQuery.of(context).size.width / 2;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorConstant().backgroundColor,
        appBar: _appBar(context),
        body: TabBarView(
          children: [
            Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: FutureBuilder(
                            future: urunService.getTask(),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.done:
                                  if (snapshot.hasData) {
                                    return GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio:
                                            (itemWidth / itemHeight),
                                      ),
                                      shrinkWrap: false,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Image.network(
                                                    '${snapshot.data[index].resim}'),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        '${snapshot.data[index].isim}'),
                                                    Text(
                                                        '${snapshot.data[index].fiyat} TL'),
                                                  ],
                                                ),
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.blue,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        urunService.addTask(
                                                            snapshot
                                                                .data[index]);
                                                      });
                                                    },
                                                    child: Text('Satin Al')),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: snapshot.data.length,
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  break;
                                default:
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                              }
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: FutureBuilder(
                            future: urunService.getSiparis(),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.done:
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, value) {
                                          return Card(
                                            child: ListTile(
                                              title: Text(
                                                  '${snapshot.data[value].id}'),
                                              subtitle: Text(
                                                  'urun: ${snapshot.data[value].urun}'),
                                              trailing: Text(
                                                  'adet: ${snapshot.data[value].adet}'),
                                            ),
                                          );
                                        });
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  break;
                                default:
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                              }
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        bottomNavigationBar: navBarMenu(context),
      ),
    );
  }

  Container navBarMenu(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.08),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorConstant().navBarShadow,
            blurRadius: 10,
          )
        ],
        color: ColorConstant().menuColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: TabBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          tabs: [
            Text(
              'Sepet',
              style: TextStyle(color: Colors.blue),
            ),
            Text(
              'Siparis',
              style: TextStyle(color: Colors.blue),
            ),
          ]),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text('CORONA CAFE'),
      centerTitle: true,
    );
  }
}
