import 'package:flutter/material.dart';
import 'startPage.dart';

class MyDrawer extends StatelessWidget {
  Color fontGrey = const Color.fromARGB(255, 112, 112, 112);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          NewDrawerHeader(),
          ListTile(
            leading: Icon(Icons.pin_drop),
            title: Text('附近的人'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.timer),
            title: Text('定时停止播放'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text('退出'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class NewDrawerHeader extends StatelessWidget {
  // 头部drawer
  Color fontGrey = const Color.fromARGB(255, 112, 112, 112);
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
      ),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('登录网易云音乐', style: TextStyle(fontSize: 12, color: fontGrey)),
          Text('手机电脑多端同步，尽享海量高品质音乐',
              style: TextStyle(fontSize: 12, color: fontGrey)),
          Container(
            height: 25,
            margin: EdgeInsets.only(top: 20),
            child: FlatButton(
              child: Text(
                '立即登录',
                style: TextStyle(color: fontGrey, fontSize: 12),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.grey)),
              padding: EdgeInsets.symmetric(horizontal: 30),
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => StartPage()));
              },
            ),
          )
        ],
      )),
    );
  }
}
