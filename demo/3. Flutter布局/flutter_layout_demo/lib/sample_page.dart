import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SamplePage extends StatelessWidget {
  const SamplePage();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /// Line 1
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: new Text(
          "发布成功",
          style: new TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.normal),
        ),
        leading: IconButton(
            icon: new Image.asset("assets/images/nav_close.png"),
            onPressed: () {
              Navigator.maybePop(context);
            }),
      ),

      /// Line 2-5
      body: new SamplePageContent(),
    );
  }
}

class SamplePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 42.0),
      child: new Column(
        children: <Widget>[
          /// Line 2
          new Row(
            children: <Widget>[
              new Container(
                width: 52.0,
                height: 52.0,
                margin: const EdgeInsets.only(left: 16.0),
                child: new CircleAvatar(
                  backgroundImage: new AssetImage("assets/images/avatar2.png"),
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(left: 7.0, right: 15.0),
                height: 48.0,
                child: new Stack(
                  children: <Widget>[
                    new Image.asset("assets/images/publish_chat_box.png"),
                    new Positioned(
                        left: 25.0,
                        top: 14.0,
                        child: new Text(
                          "张老师发布了一个任务，请接收～",
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),

          /// Line 3
          new Container(
            margin: const EdgeInsets.fromLTRB(6.0, 24.0, 6.0, 30.0),
            child: new RoundInnerSquareBox(
              child: new Container(
                padding: const EdgeInsets.fromLTRB(24.0, 28.0, 24.0, 12.0),
                width: double.infinity,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      "Unit 1 Lesson 3 About animal",
                      style: new TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Round",
                        color: Colors.white,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(top: 5.0, bottom: 13.0),
                      child: new Image.asset(
                          "assets/images/publish_work_line.png"),
                    ),
                    new Wrap(
                      alignment: WrapAlignment.start,
                      children: <Widget>[
                        new WorkTotalItem(
                          title: "课文跟读 12",
                        ),
                        new WorkTotalItem(
                          title: "课文跟读 12",
                        ),
                        new WorkTotalItem(
                          title: "课文跟读 12",
                        ),
                        new WorkTotalItem(
                          title: "课文跟读 12",
                        ),
                      ],
                    ),
                    new Container(
                      margin: const EdgeInsets.only(left: 178.0),
                      child: new Stack(
                        children: <Widget>[
                          new Image.asset(
                              "assets/images/publish_work_sign.png"),
                          new Positioned(
                            left: 4.0,
                            top: 4.0,
                            child: new Text(
                              "预习",
                              style: new TextStyle(
                                  fontSize: 14.0, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      alignment: Alignment.topRight,
                      child: new Text(
                        "明天12:00截止",
                        style: new TextStyle(
                            fontSize: 12.0, color: const Color(0xFFFFC1C1)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Line 4
          new LineTips(
            title: new Text(
              "给家长发个通知吧",
              style:
              new TextStyle(fontSize: 14.0, color: const Color(0xFF757085)),
            ),
          ),

          /// Line 5
          new Container(
            margin: const EdgeInsets.only(top: 32.0),
            height: 60.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 60.0,
                    icon: new Image.asset("assets/images/share_wechat.png"),
                    onPressed: () {
                      print("share to wechat");
                    }),
                new Container(
                  margin: const EdgeInsets.only(left: 32.0),
                  child: new IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 60.0,
                      icon: new Image.asset("assets/images/share_qq.png"),
                      onPressed: () {
                        print("share to qq");
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoundInnerSquareBox extends StatelessWidget {
  static const double gap = 12.0;

  RoundInnerSquareBox({
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new ClipRRect(
      borderRadius: const BorderRadius.all(const Radius.circular(16.0)),
      child: new Container(
        color: const Color(0xFFF0D5A9),
        padding: const EdgeInsets.all(gap),
        child: new Container(
          child: new Container(
            color: const Color(0xFF3C594E),
            child: child,
          ),
        ),
      ),
    );
  }
}

class LineTips extends StatelessWidget {
  static const defaultMargin = const EdgeInsets.only(left: 15.0, right: 15.0);

  LineTips({
    @required this.title,
    this.margin = defaultMargin,
  });

  final Widget title;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: defaultMargin,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Expanded(
            child: new Container(
              margin: const EdgeInsets.only(
                right: 10.0,
              ),
              color: const Color(0xFFD4CFE4),
              height: 1.0,
            ),
          ),
          title,
          new Expanded(
            child: new Container(
              margin: const EdgeInsets.only(
                left: 10.0,
              ),
              color: const Color(0xFFD4CFE4),
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}

class WorkTotalItem extends StatelessWidget {
  WorkTotalItem({
    this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(6.0),
      child: new Text(
        "$title",
        style: new TextStyle(
          fontSize: 14.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
