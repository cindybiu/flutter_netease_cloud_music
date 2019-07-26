import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 100, 0, 100),
              height: 60,
              width: 60,
              child: ClipOval(
                child: Image.asset('lib/images/logo.png'),
              ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 0, 0),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 200,
                    child: FlatButton(
                      child: Text(
                        '手机号登录',
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white)),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: FlatButton(
                      child: Text(
                        '立即体验',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
