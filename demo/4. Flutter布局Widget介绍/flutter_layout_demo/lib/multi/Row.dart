import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LYRow extends StatelessWidget {
  const LYRow();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Row"),
        leading: new BackButton(),
      ),
      body: new LYRowContent(),
    );
  }
}

class LYRowContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Row"),
    );
  }
}