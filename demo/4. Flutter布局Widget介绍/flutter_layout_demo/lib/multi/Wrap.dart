import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LYWrap extends StatelessWidget {
  const LYWrap();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Wrap"),
        leading: new BackButton(),
      ),
      body: new LYWrapContent(),
    );
  }
}

class LYWrapContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // gap between adjacent chips
      runSpacing: 4.0, //
      children: <Widget>[
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: new Text('AH', style: TextStyle(fontSize: 10.0),)),
          label: Text('Hamilton'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: new Text('ML', style: TextStyle(fontSize: 10.0),)),
          label: Text('Lafayette'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: new Text('HM', style: TextStyle(fontSize: 10.0),)),
          label: Text('Mulligan'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900, child: new Text('JL', style: TextStyle(fontSize: 10.0),)),
          label: Text('Laurens'),
        ),
      ],
    );
  }
}
