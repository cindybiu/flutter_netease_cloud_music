import 'package:flutter/material.dart';
import 'myDrawer.dart';
import 'mainMyPage.dart';
import 'mainFindPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ['我的', '发现'];
  ProxyAnimation transitionAnimation =
      ProxyAnimation(kAlwaysDismissedAnimation);
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: tabs.length, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: AppBar(
            title: Container(
              height: 30,
              child: TabBar(
                  labelStyle: TextStyle(fontSize: 16),
                  unselectedLabelStyle: TextStyle(fontSize: 14),
                  indicatorPadding: EdgeInsets.zero,
                  indicatorColor: Colors.white,
                  labelColor: Colors.black,
                  controller: _tabController,
                  tabs: tabs.map((e) => Tab(text: e)).toList()),
            ),
            titleSpacing: 0.0,
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: Builder(builder: (context) {
              return IconButton(
                  icon: Icon(Icons.menu, color: Colors.black),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  });
            }),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  onPressed: () {})
            ],
          ),
        ),
        drawer: SizedBox(child: MyDrawer(), width: 250),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[MainMypage(), MainFindPage()],
        ));
  }
}
