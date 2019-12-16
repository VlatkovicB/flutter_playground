import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionSheetExample extends StatelessWidget {
  static const String routeName = '/actionsheet-example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('ActionSheet example'),
        previousPageTitle: 'Back',
      ),
      body: CupertinoActionSheet(
        actions: <Widget>[
          Center(
            child: Text('First action'),
          ),
          Center(
            child: Text('Second action'),
          ),
        ],
        cancelButton: Center(
          child: Text('Cancel'),
        ),
      ),
    );
  }
}
