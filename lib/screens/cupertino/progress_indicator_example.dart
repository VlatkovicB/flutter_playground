import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProgressIndicatorExample extends StatelessWidget {
  static const String routeName = '/progressindicator-example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('ProgressIndicator example'),
        previousPageTitle: 'Back',
      ),
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
