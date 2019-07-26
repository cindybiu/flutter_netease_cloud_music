import 'package:flutter/material.dart';

class PlaListDetail extends StatefulWidget {
  int id;
  PlaListDetail({Key key, this.id}) : super(key: key);
  @override
  _PlaListDetailState createState() => _PlaListDetailState();
}

class _PlaListDetailState extends State<PlaListDetail> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.id.toString()),
    );
  }
}
