import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LYPadding extends StatelessWidget {
  const LYPadding();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Padding"),
        leading: new BackButton(),
      ),
      body: new LYContainerContent(),
    );
  }
}

class LYContainerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Padding"),
    );
  }
}
