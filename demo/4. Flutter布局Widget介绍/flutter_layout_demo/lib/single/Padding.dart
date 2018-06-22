import 'package:flutter/material.dart';

class LYPadding extends StatelessWidget {
  const LYPadding();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Padding"),
        leading: new BackButton(),
      ),
      body: new LYPaddingContent(),
    );
  }
}

class LYPaddingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 50.0, 40.0, 40.0),
      child: new Text("Padding"),
    );
  }
}
