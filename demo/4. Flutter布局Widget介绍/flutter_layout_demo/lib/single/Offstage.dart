import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LYOffstage extends StatelessWidget {
  const LYOffstage();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Offstage"),
        leading: new BackButton(),
      ),
      body: new LYOffstageContent(),
    );
  }
}

class LYOffstageContent extends StatefulWidget {
  @override
  _LYOffstageContentState createState() => _LYOffstageContentState();
}

class _LYOffstageContentState extends State<LYOffstageContent> {
  bool offstage;

  @override
  void initState() {
    super.initState();
    offstage = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Offstage(
          offstage: offstage,
          child: Container(color: Colors.blue, height: 100.0),
        ),
        new CupertinoButton(
          child: Text("点击切换显示"),
          onPressed: () {
            setState(() {
              offstage = !offstage;
            });
          },
        ),
      ],
    );
  }
}
