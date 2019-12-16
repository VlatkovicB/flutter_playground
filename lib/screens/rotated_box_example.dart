import 'package:flutter/material.dart';

class RotatedBoxExample extends StatelessWidget {
  static const String routeName = '/rotatedbox-example';
  @override
  Widget build(BuildContext context) {
    String text = 'Hello World!';

    return Scaffold(
      appBar: AppBar(
        title: Text('RotatedBoxExample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RotatedBox(
              child: Text(text),
              quarterTurns: 1,
            ),
            RotatedBox(
              child: Text(text),
              quarterTurns: 2,
            ),
            RotatedBox(
              child: Text(text),
              quarterTurns: 3,
            ),
            RotatedBox(
              child: Text(text),
              quarterTurns: 4,
            ),
          ],
        ),
      ),
    );
  }
}
