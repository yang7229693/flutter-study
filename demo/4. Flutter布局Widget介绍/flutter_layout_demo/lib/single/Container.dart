import 'package:flutter/material.dart';

class LYContainer extends StatelessWidget {
  const LYContainer();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text("Container"),
        leading: new BackButton(),
      ),
      body: new LYContainerContent(),
    );
  }
}

class LYContainerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: new Wrap(
        children: <Widget>[
          new Container(
            constraints: new BoxConstraints.expand(
              height:
                  Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
            ),
            decoration: new BoxDecoration(
              border: new Border.all(width: 2.0, color: Colors.red),
              color: Colors.grey,
              borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
              image: new DecorationImage(
                image: new NetworkImage(
                    'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
                centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: new Text('Hello World',
                style: Theme
                    .of(context)
                    .textTheme
                    .display1
                    .copyWith(color: Colors.black)),
            transform: new Matrix4.rotationZ(0.3),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 105.0),
            child: new LYRoundButton(
              title: new Text(
                "I am a default button",
                style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              disabled: false,
              onPress: () {
                final snackBar = new SnackBar(content: new Text('Click One!!'));
                Scaffold.of(context).showSnackBar(snackBar);
              },
            ),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: new LYRoundButton(
              width: 250.0,
              height: 80.0,
              backgroundColor: const Color(0xFF41CB39),
              activeBackgroundColor: const Color(0xB341CB39),
              disabledBackgroundColor: const Color(0x3341CB39),
              title: new Text(
                "I am a custom button",
                style: new TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              disabled: false,
              onPress: () {
                final snackBar = new SnackBar(content: new Text('Click Two!!'));
                Scaffold.of(context).showSnackBar(snackBar);
              },
            ),
          ),
          new LYRoundButton(
            title: new Text(
              "I`m a disabled button",
              style: new TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            disabled: true,
            onPress: () {
              final snackBar = new SnackBar(content: new Text('Click Three!!'));
              Scaffold.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
    );
  }
}

class LYRoundButton extends StatefulWidget {
  static const defaultBackgroundColor = const Color(0xFF8B5FFE);
  static const defaultActiveBackgroundColor = const Color(0xB38B5FFE);
  static const defaultDisabledBackgroundColor = const Color(0x338B5FFE);

  LYRoundButton({
    this.title,
    this.onPress,
    this.height = 52.0,
    this.width = double.infinity,
    this.disabled = false,
    this.backgroundColor = defaultBackgroundColor,
    this.activeBackgroundColor = defaultActiveBackgroundColor,
    this.disabledBackgroundColor = defaultDisabledBackgroundColor,
  });

  final Widget title;
  final Color backgroundColor, activeBackgroundColor, disabledBackgroundColor;
  final VoidCallback onPress;
  final double height, width;
  final bool disabled;

  @override
  _LYRoundButtonState createState() => new _LYRoundButtonState();
}

class _LYRoundButtonState extends State<LYRoundButton> {
  Color currentColor;

  @override
  void initState() {
    super.initState();
    if (widget.disabled) {
      currentColor = widget.disabledBackgroundColor;
    } else {
      currentColor = widget.backgroundColor;
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    currentColor = widget.backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        if (widget.onPress != null && !widget.disabled) {
          widget.onPress();
        }
      },
      onTapDown: (TapDownDetails details) {
        if (!widget.disabled) {
          setState(() {
            currentColor = widget.activeBackgroundColor;
          });
        }
      },
      onTapUp: (TapUpDetails details) {
        if (!widget.disabled) {
          setState(() {
            currentColor = widget.backgroundColor;
          });
        }
      },
      onTapCancel: () {
        if (!widget.disabled) {
          setState(() {
            currentColor = widget.backgroundColor;
          });
        }
      },
      child: new Container(
        decoration: new BoxDecoration(
          color: currentColor,
          borderRadius:
              new BorderRadius.all(new Radius.circular(widget.height / 2.0)),
        ),
        height: widget.height,
        width: widget.width,
        alignment: Alignment.center,
        child: widget.title,
      ),
    );
  }
}
