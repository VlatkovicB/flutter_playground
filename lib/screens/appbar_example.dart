import 'package:flutter/material.dart';

class AppBarExample extends StatelessWidget {
  static const String routeName = '/appbar-example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Examples'),
      ),
    );
  }
}
