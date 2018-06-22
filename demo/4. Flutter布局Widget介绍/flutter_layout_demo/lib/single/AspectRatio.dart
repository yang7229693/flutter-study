import 'package:flutter/material.dart';

class LYAspectRatio extends StatelessWidget {
  const LYAspectRatio();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("AspectRatio"),
        leading: new BackButton(),
      ),
      body: new LYAspectRatioContent(),
    );
  }
}

class LYAspectRatioContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 200.0,
      child: new AspectRatio(
        aspectRatio: 1.5,
        child: new Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
