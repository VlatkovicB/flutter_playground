import 'package:flutter/material.dart';

class LifecycleExample extends StatefulWidget {
  static const String routeName = '/lifecycle-example';

  @override
  _LifecycleExampleState createState() => _LifecycleExampleState();
}

class _LifecycleExampleState extends State<LifecycleExample>
    with WidgetsBindingObserver {
  List<AppLifecycleState> _appLifecycleState = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      _appLifecycleState.add(state);
    });
  }

  List<Widget> _stateString() {
    if (_appLifecycleState != null) {
      return List<Widget>.generate(_appLifecycleState.length, (int index) {
        return Text('lifecycle state : $_appLifecycleState,');
      });
    } else {
      return List<Widget>.generate(1, (int index) {
        return Text('App started');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lifecycle Example'),
      ),
      body: ListView(
        children: _stateString(),
      ),
    );
  }
}
