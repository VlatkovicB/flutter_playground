import 'package:flutter/material.dart';

class StaggerAnimationsExample extends StatefulWidget {
  static const String routeName = '/staggeranimations-example';

  @override
  _StaggerAnimationsExampleState createState() =>
      _StaggerAnimationsExampleState();
}

class _StaggerAnimationsExampleState extends State<StaggerAnimationsExample>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _animationController.forward().orCancel;
      await _animationController.reverse().orCancel;
    } on TickerCanceled {
      print('Ticker canceled.');
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: Text('StaggerAnimationsExample'),
      ),
      body: GestureDetector(
        onTap: _playAnimation,
        child: Center(
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            child: ToBeAnimated(
              controller: _animationController,
            ),
          ),
        ),
      ),
    );
  }
}

class ToBeAnimated extends StatelessWidget {
  final AnimationController controller;

  ToBeAnimated({this.controller});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (ctx, child) => Container(
        padding: _padding(),
        alignment: Alignment.bottomCenter,
        child: Opacity(
          opacity: _opacity(),
          child: Container(
            width: _width(context),
            height: _height(context),
            decoration: BoxDecoration(
              color: _color(context),
              border: Border.all(
                color: _color(context),
                width: 3,
              ),
              borderRadius: _borderRadius(context),
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets _padding() {
    return EdgeInsetsTween(
      begin: const EdgeInsets.only(bottom: 20),
      end: const EdgeInsets.only(bottom: 75),
    )
        .animate(
          CurvedAnimation(
            reverseCurve: Curves.fastLinearToSlowEaseIn,
            parent: controller,
            curve: Interval(
              0.250,
              0.395,
              curve: Curves.ease,
            ),
          ),
        )
        .value;
  }

  double _opacity() {
    return Tween<double>(end: 1, begin: 0.2)
        .animate(
          CurvedAnimation(
            parent: controller,
            reverseCurve: Curves.easeIn,
            curve: Interval(0, 0.100, curve: Curves.ease),
          ),
        )
        .value;
  }

  double _width(BuildContext context) {
    return Tween<double>(
      begin: 50,
      end: MediaQuery.of(context).size.width * 0.5,
    )
        .animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.125,
              0.270,
              curve: Curves.bounceInOut,
            ),
            reverseCurve: Curves.fastLinearToSlowEaseIn,
          ),
        )
        .value;
  }

  double _height(BuildContext context) {
    return Tween<double>(
      begin: 100,
      end: MediaQuery.of(context).size.width * 0.5,
    )
        .animate(
          CurvedAnimation(
            curve: Interval(0.270, 0.395, curve: Curves.ease),
            reverseCurve: Curves.fastLinearToSlowEaseIn,
            parent: controller,
          ),
        )
        .value;
  }

  BorderRadius _borderRadius(BuildContext context) {
    return BorderRadiusTween(
      begin: BorderRadius.circular(0),
      end: BorderRadius.circular(MediaQuery.of(context).size.width * 0.5 / 2),
    )
        .animate(
          CurvedAnimation(
            parent: controller,
            reverseCurve: Curves.fastLinearToSlowEaseIn,
            curve: Interval(
              0.395,
              0.520,
              curve: Curves.ease,
            ),
          ),
        )
        .value;
  }

  Color _color(BuildContext context) {
    return ColorTween(
            begin: Colors.indigo[300], end: Theme.of(context).accentColor)
        .animate(
          CurvedAnimation(
            curve: Interval(0.520, 0.770, curve: Curves.ease),
            parent: controller,
            reverseCurve: Curves.fastLinearToSlowEaseIn,
          ),
        )
        .value;
  }
}
