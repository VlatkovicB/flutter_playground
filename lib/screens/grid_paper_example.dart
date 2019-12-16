import 'package:flutter/material.dart';

class GridPaperExample extends StatelessWidget {
  static const String routeName = '/gridpaper-example';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridPaperExample'),
      ),
      body: GridPaper(
        color: Theme.of(context).primaryColor,
        child: Container(),
      ),
    );
  }
}
