import 'dart:async';

import 'package:flutter/material.dart';

class ProgressButtonExample extends StatefulWidget {
  static const String routeName = '/progressbutton-example';
  @override
  _ProgressButtonExampleState createState() => _ProgressButtonExampleState();
}

class _ProgressButtonExampleState extends State<ProgressButtonExample>
    with TickerProviderStateMixin {
  int _state = 0;
  Animation _animation;
  AnimationController _animationController;
  GlobalKey _globalKey = GlobalKey();
  double _width = double.infinity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress Button Example"),
      ),
      body: Center(
        child: Container(
          child: PhysicalModel(
            color: Theme.of(context).accentColor,
            shadowColor: Colors.blueGrey,
            elevation: 6,
            borderRadius: BorderRadius.circular(24.0),
            child: Container(
              key: _globalKey,
              height: 48,
              width: _width,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_state == 0) {
                      animateButton();
                    } else {
                      _state = 0;
                      _width = double.infinity;
                    }
                  });
                },
                child: InkWell(
                  splashColor: Colors.green,
                  child: Center(
                    child: setUpButton(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  setUpButton() {
    if (_state == 0) {
      return Text(
        "Click Here",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        // value: _animation.value,
        value: null,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    double initialWidth = _globalKey.currentContext.size.width;

    _animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {
          _width = initialWidth - ((initialWidth - 48.0) * _animation.value);
        });
      });
    _animationController.forward();

    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 1500), () {
      setState(() {
        _state = 2;
      });
    });
  }
}
