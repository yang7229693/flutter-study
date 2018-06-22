import 'package:flutter/material.dart';

class LYCenter extends StatelessWidget {
  const LYCenter();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Center"),
        leading: new BackButton(),
      ),
      body: new LYCenterContent(),
    );
  }
}

class LYCenterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Center"),
    );
  }
}
