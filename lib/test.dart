

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

typedef State Reducer<State>(State state, dynamic action);

class LiupengState {
  ThemeData themeData;
  LiupengState({this.themeData});
}

LiupengState appReducer(LiupengState state, action) {
  return LiupengState(
    themeData: themeDataDeducer(state.themeData, action),
  );
}

final themeDataDeducer = combineReducers<ThemeData>([
  TypedReducer<ThemeData, UpdateThemeData>(_updateThemeData),
]);

ThemeData _updateThemeData(ThemeData themeData, action) {
  themeData = action.themeData;
  return themeData;
}

class UpdateThemeData {
  final ThemeData themeData;
  UpdateThemeData(this.themeData);
}

void main() {
  runApp(new ReduxApp());
}

class ReduxApp extends StatelessWidget {
  final store = new Store<LiupengState>(
    appReducer,
    initialState: new LiupengState(
        themeData: ThemeData(
      primaryColor: Colors.black,
    )),
  );
  ReduxApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: StoreBuilder<LiupengState>(
          builder: (context, store) {
            return MaterialApp(
              theme: store.state.themeData,
              home: Newpage(),
            );
          },
        ));
  }
}

class Newpage extends StatelessWidget {
  TextStyle fontColor = TextStyle(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('皮肤')),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
                child: Text('蓝色', style: fontColor),
                onPressed: () {
                  ThemeData themeData =
                      new ThemeData(primarySwatch: Colors.blue);
                  StoreProvider.of<LiupengState>(context)
                      .dispatch(new UpdateThemeData(themeData));
                },
                color: Colors.blue),
            FlatButton(
                child: Text('红色', style: fontColor),
                onPressed: () {
                  ThemeData themeData =
                      new ThemeData(primarySwatch: Colors.red);
                  StoreProvider.of<LiupengState>(context)
                      .dispatch(new UpdateThemeData(themeData));
                },
                color: Colors.red),
            FlatButton(
                child: Text('绿色', style: fontColor),
                onPressed: () {
                  ThemeData themeData =
                      new ThemeData(primarySwatch: Colors.green);
                  StoreProvider.of<LiupengState>(context)
                      .dispatch(new UpdateThemeData(themeData));
                },
                color: Colors.green),
          ],
        ),
      ),
    );
  }
}
