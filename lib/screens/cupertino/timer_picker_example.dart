import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerPickerExample extends StatelessWidget {
  static const String routeName = '/timerpicker-example';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Timer Picker Example'),
        previousPageTitle: 'Back',
      ),
      body: Center(
        child: CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hms,
          initialTimerDuration: Duration(hours: 1),
          onTimerDurationChanged: (value) {
            print(value);
          },
        ),
      ),
    );
  }
}
