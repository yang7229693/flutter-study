import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LYListBody extends StatelessWidget {
  const LYListBody();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListBody"),
        leading: new BackButton(),
      ),
      body: new LYListBodyContent(),
    );
  }
}

class LYListBodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        ListBody(
          mainAxis: Axis.vertical,
          reverse: false,
          children: <Widget>[
            Container(color: Colors.red, width: 50.0, height: 50.0,),
            Container(color: Colors.yellow, width: 50.0, height: 50.0,),
            Container(color: Colors.green, width: 50.0, height: 50.0,),
            Container(color: Colors.blue, width: 50.0, height: 50.0,),
            Container(color: Colors.black, width: 50.0, height: 50.0,),
          ],
      )],
    );
  }
}
