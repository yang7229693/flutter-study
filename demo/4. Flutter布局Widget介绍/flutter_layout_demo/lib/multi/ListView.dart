import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LYListView extends StatelessWidget {
  const LYListView();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView"),
        leading: new BackButton(),
      ),
      body: new LYListViewContent(),
    );
  }
}

class LYListViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.0),
      children: <Widget>[
        Text('I\'m dedicating every day to you'),
        Text('Domestic life was never quite my style'),
        Text('When you smile, you knock me out, I fall apart'),
        Text('And I thought I was so smart'),
      ],
    );
  }
}
