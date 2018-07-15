import 'package:flutter/material.dart';

class LYIntrinsicHeight extends StatelessWidget {
  const LYIntrinsicHeight();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("IntrinsicHeight"),
        leading: new BackButton(),
      ),
      body: new LYIntrinsicHeightContent(),
    );
  }
}

class LYIntrinsicHeightContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new IntrinsicHeight(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Container(color: Colors.blue, width: 100.0),
          new Container(color: Colors.red, width: 50.0,height: 50.0,),
          new Container(color: Colors.yellow, width: 150.0),
        ],
      ),
    );
  }
}
