import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LYListViewBuilder extends StatelessWidget {
  const LYListViewBuilder();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListViewBuilder"),
        leading: new BackButton(),
      ),
      body: new LYListViewBuilderContent(),
    );
  }
}

class LYListViewBuilderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("ListViewBuilder"),
    );
  }
}