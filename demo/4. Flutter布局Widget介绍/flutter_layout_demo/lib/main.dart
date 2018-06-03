import 'package:flutter/material.dart';
import 'package:flutter_layout_demo/single/Container.dart';
import 'package:flutter_layout_demo/single/Padding.dart';

void main() => runApp(new MyApp());

const List<String> singleLayoutWidgets = [
  "Container",
  "Padding",
  "Center",
  "Align",
  "FittedBox",
  "AspectRatio",
  "ConstrainedBox",
  "Baseline",
  "FractionallySizedBox",
  "IntrinsicHeight",
  "IntrinsicWidth",
  "LimitedBox",
  "Offstage",
  "OverflowBox",
  "SizedBox",
  "SizedOverflowBox",
  "Transform",
  "CustomSingleChildLayout",
];

const List<String> multiLayoutWidgets = [
  "Row",
  "Column",
  "Stack",
  "IndexedStack",
  "Flow",
  "Table",
  "Wrap",
  "ListBody",
  "ListView",
  "CustomMultiChildLayout",
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Layout Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        '/Container': (BuildContext context) => new LYContainer(),
        '/Padding': (BuildContext context) => new LYPadding(),

        '/Center': (BuildContext context) => new LYPadding(),
        '/Align': (BuildContext context) => new LYPadding(),
        '/FittedBox': (BuildContext context) => new LYPadding(),
        '/AspectRatio': (BuildContext context) => new LYPadding(),
        '/ConstrainedBox': (BuildContext context) => new LYPadding(),
        '/Baseline': (BuildContext context) => new LYPadding(),
        '/FractionallySizedBox': (BuildContext context) => new LYPadding(),
        '/IntrinsicHeight': (BuildContext context) => new LYPadding(),
        '/IntrinsicWidth': (BuildContext context) => new LYPadding(),
        '/LimitedBox': (BuildContext context) => new LYPadding(),
        '/Offstage': (BuildContext context) => new LYPadding(),
        '/OverflowBox': (BuildContext context) => new LYPadding(),
        '/SizedBox': (BuildContext context) => new LYPadding(),
        '/SizedOverflowBox': (BuildContext context) => new LYPadding(),
        '/Transform': (BuildContext context) => new LYPadding(),
        '/CustomSingleChildLayout': (BuildContext context) => new LYPadding(),

        '/Row': (BuildContext context) => new LYPadding(),
        '/Column': (BuildContext context) => new LYPadding(),
        '/Stack': (BuildContext context) => new LYPadding(),
        '/IndexedStack': (BuildContext context) => new LYPadding(),
        '/Flow': (BuildContext context) => new LYPadding(),
        '/Table': (BuildContext context) => new LYPadding(),
        '/Wrap': (BuildContext context) => new LYPadding(),
        '/ListBody': (BuildContext context) => new LYPadding(),
        '/ListView': (BuildContext context) => new LYPadding(),
        '/CustomMultiChildLayout': (BuildContext context) => new LYPadding(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

void _navigateToPage(BuildContext context, String page) {
  print("Page:$page");
  Navigator.of(context).pushNamed('/$page');
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> layoutWidgets = [];
    layoutWidgets.add("--Single-child layout widgets--");
    layoutWidgets.addAll(singleLayoutWidgets);
    layoutWidgets.add("--Multi-child layout widgets--");
    layoutWidgets.addAll(multiLayoutWidgets);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext buildContext, int index) {
          return new ListTile(
            title: new LayoutListItem(
              index: index,
              title: layoutWidgets[index],
              onPress: () {
                String item = layoutWidgets[index];
                if (item.startsWith("--")) {
                  return;
                }

                _navigateToPage(context, layoutWidgets[index]);
              },
            ),
          );
        },
        itemCount: (singleLayoutWidgets.length + multiLayoutWidgets.length + 2),
      ),
    );
  }
}

class LayoutListItem extends StatelessWidget {
  LayoutListItem({this.index, this.title, this.onPress});

  final int index;
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPress,
      child: new Center(
        child: new Text(
          "$title",
          style: new TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }
}
