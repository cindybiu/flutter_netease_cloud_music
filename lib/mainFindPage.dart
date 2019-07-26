import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';
import 'playListDetails.dart';
import 'package:dio/dio.dart';

class MainFindPage extends StatefulWidget {
  @override
  _MainFindPageState createState() => _MainFindPageState();
}

class _MainFindPageState extends State<MainFindPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Banners(),
            Container(
              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                      child: _ItemNavigator(Icons.insert_invitation, '每日推荐')),
                  Expanded(child: _ItemNavigator(Icons.audiotrack, '歌单')),
                  Expanded(child: _ItemNavigator(Icons.trending_up, '排行榜')),
                  Expanded(child: _ItemNavigator(Icons.mic_none, '电台')),
                  Expanded(child: _ItemNavigator(Icons.whatshot, '直播')),
                ],
              ),
            ),
            Playlist(),
          ],
        ),
      ),
    );
  }
}

class Banners extends StatefulWidget {
  // banner
  @override
  _BannersState createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  List<Widget> banners = List();
  @override
  void initState() {
    super.initState();
    banners
      ..add(ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
            'http://p1.music.126.net/3cMKse9FQhJmGDySDUQVKQ==/109951164232198454.jpg',
            fit: BoxFit.fill),
      ))
      ..add(ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
            'http://p1.music.126.net/Pf4oBIzi5FczsevLw52E6g==/109951164231918088.jpg',
            fit: BoxFit.fill),
      ))
      ..add(ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
            'http://p1.music.126.net/gaPG1z6e3K7dAxI0v3fj8w==/109951164232477996.jpg',
            fit: BoxFit.fill),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width,
      height: 140.0,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        scale: 0.8,
        viewportFraction: 0.93,
        itemCount: 3,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
          color: Colors.black54,
          activeColor: Colors.white,
          size: 8,
        )),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index个'),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return (banners[index]);
  }
}

class _ItemNavigator extends StatelessWidget {
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Material(
            shape: CircleBorder(),
            child: ClipOval(
              child: Container(
                color: Colors.red,
                width: 35,
                height: 35,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 5)),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          ),
        ],
      )),
    );
  }

  _ItemNavigator(this.icon, this.text);
}

class Playlist extends StatefulWidget {
  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  String url = "http://10.0.2.2:3000/personalized";
  List playlist = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    Dio dio = new Dio();
    Response res = await dio.get(url);
    setState(() {
      playlist = res.data['result'].sublist(0, 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text('推荐歌单',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
              Container(
                height: 25,
                child: FlatButton(
                  onPressed: () {
                    _getData();
                  },
                  child: Text(
                    '歌单广场',
                    style: TextStyle(fontSize: 13),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.grey[400])),
                ),
              )
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: 6),
            child: Wrap(
                direction: Axis.horizontal,
                spacing: 10.0,
                runSpacing: 10,
                children: playlist
                    .map((item) =>
                        _PlaylistItem(item['picUrl'], item['name'], item['id']))
                    .toList()))
      ],
    );
  }
}

class _PlaylistItem extends StatelessWidget {
  final String imgurl;
  final String songName;
  int id;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PlaListDetail(id:id)));
        print(id);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 95,
            child: Image.network(
              imgurl,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 95,
            padding: EdgeInsets.only(top: 5),
            child: Text(
              songName,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }

  _PlaylistItem(this.imgurl, this.songName, this.id);
}
