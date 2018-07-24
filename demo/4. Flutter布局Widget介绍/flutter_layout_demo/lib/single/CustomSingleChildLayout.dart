import 'package:flutter/material.dart';

class LYCustomSingleChildLayout extends StatelessWidget {
  const LYCustomSingleChildLayout();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CustomSingleChildLayout"),
        leading: new BackButton(),
      ),
      body: new LYCustomSingleChildLayoutContent(),
    );
  }
}

class LYCustomSingleChildLayoutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(5.0),
      child: CustomSingleChildLayout(
        delegate: FixedSizeLayoutDelegate(Size(200.0, 200.0)),
        child: Container(
          color: Colors.red,
          width: 100.0,
          height: 300.0,
        ),
      ),
    );
  }
}

class FixedSizeLayoutDelegate extends SingleChildLayoutDelegate {
  FixedSizeLayoutDelegate(this.size);

  final Size size;

  @override
  Size getSize(BoxConstraints constraints) => size;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return new BoxConstraints.tight(size);
  }

  @override
  bool shouldRelayout(FixedSizeLayoutDelegate oldDelegate) {
    return size != oldDelegate.size;
  }
}
