import 'package:flutter/material.dart';

class ItemNavigator extends StatelessWidget {
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

  ItemNavigator(this.icon, this.text);
}
