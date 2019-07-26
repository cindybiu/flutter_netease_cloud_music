import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();
  var _scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text(
          '手机号登录',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Form(
              key: _formKey, //设置globalKey，用于后面获取FormState
              autovalidate: true, //开启自动校验
              child: Column(
                children: <Widget>[
                  TextFormField(
                      autofocus: true,
                      controller: _unameController,
                      decoration: InputDecoration(
                        labelText: "手机账号",
                        hintText: "请输入手机号",
                      ),
                      // 校验用户名
                      validator: (v) {
                        return v.trim().length > 0 ? null : "用户名不能为空";
                      }),
                  TextFormField(
                      controller: _pwdController,
                      decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "您的登录密码",
                      ),
                      obscureText: true,
                      //校验密码
                      validator: (v) {
                        return v.trim().length > 5 ? null : "密码不能少于6位";
                      }),
                  // 登录按钮
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                      child: Text("登录"),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {
                        if ((_formKey.currentState as FormState).validate()) {
                          _onLogin(_unameController.text, _pwdController.text);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ]),
    );
  }

  _onLogin(name, pwd) async {
    Response response;
    String url = "http://10.0.2.2:3000/login/cellphone";
    String result;
    Dio dio = new Dio();
    try {
      response = await dio.post(url, data: {"phone": name, "password": pwd});
      var data = response.data;
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Home()));
      showSnackBar('登录成功');
    } catch (exception) {
      result = exception.response.data['msg'];
      showSnackBar(result);
    }
  }

  void showSnackBar(String message) {
    var snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    );
    _scaffoldkey.currentState.showSnackBar(snackBar);
  }
}
