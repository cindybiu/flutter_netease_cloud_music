import 'package:flutter/material.dart';
import 'components/ItemNavigator.dart';
import 'my_icon/my_icon.dart';

class MainMypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(child: ItemNavigator(Icons.insert_invitation, '每日推荐')),
            Expanded(child: ItemNavigator(Icons.audiotrack, '歌单')),
            Expanded(child: ItemNavigator(Icons.trending_up, '排行榜')),
            Expanded(child: ItemNavigator(Icons.mic_none, '电台')),
            Expanded(child: ItemNavigator(Icons.whatshot, '直播')),
          ],
        ),
      ),
      _ListItem(MyIcon.music, '本地音乐'),
      _ListItem(MyIcon.playlist, '最近播放 '),
      _ListItem(MyIcon.download, '本地下载 '),
      _ListItem(MyIcon.radio, '我的电台 '),
      _ListItem(MyIcon.shoucang, '我的收藏 '),
    ]);
  }
}

class _ListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: Divider.createBorderSide(context, color: Colors.grey[200]))),
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(right: 20), child: Icon(icon, size: 25)),
          Text(text)
        ],
      ),
    );
  }

  _ListItem(this.icon, this.text);
}
