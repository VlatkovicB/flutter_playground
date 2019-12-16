import 'package:flutter/material.dart';

class RotationTransitionExample extends StatefulWidget {
  static const String routeName = '/rotationtransition-example';

  @override
  _RotationTransitionExampleState createState() =>
      _RotationTransitionExampleState();
}

class _RotationTransitionExampleState extends State<RotationTransitionExample>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3600))
          ..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
      appBar: AppBar(
        title: Text('RotationTransitionExample'),
      ),
      body: Center(
        child: RotationTransition(
          turns: _animationController,
          child: Container(
            decoration: FlutterLogoDecoration(),
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }
}
