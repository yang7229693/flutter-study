import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double unitSize = kToolbarHeight;

class LYCustomMultiChildLayout extends StatelessWidget {
  const LYCustomMultiChildLayout();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CustomMultiChildLayout"),
        leading: new BackButton(),
      ),
      body: new LYCustomMultiChildLayoutContent(),
    );
  }
}

class LYCustomMultiChildLayoutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 100.0,
      color: Colors.yellow,
      child: CustomMultiChildLayout(
        delegate: TestLayoutDelegate(),
        children: <Widget>[
          LayoutId(
            id: TestLayoutDelegate.title,
            child: new Text("This is title",
                style: TextStyle(fontSize: 20.0, color: Colors.black)),
          ),
          LayoutId(
            id: TestLayoutDelegate.description,
            child: new Text("This is description",
                style: TextStyle(fontSize: 14.0, color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class TestLayoutDelegate extends MultiChildLayoutDelegate {
  TestLayoutDelegate();

  static const String title = 'title';
  static const String description = 'description';

  @override
  void performLayout(Size size) {
    final BoxConstraints constraints =
        new BoxConstraints(maxWidth: size.width);

    final Size titleSize = layoutChild(title, constraints);
    positionChild(title, new Offset(0.0, 0.0));

    final double descriptionY = titleSize.height;
    layoutChild(description, constraints);
    positionChild(description, new Offset(0.0, descriptionY));
  }

  @override
  bool shouldRelayout(TestLayoutDelegate oldDelegate) => false;
}
