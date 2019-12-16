import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HardwareKeyExample extends StatefulWidget {
  static const String routeName = '/hardwarekey-example';

  @override
  _HardwareKeyExampleState createState() => _HardwareKeyExampleState();
}

class _HardwareKeyExampleState extends State<HardwareKeyExample> {
  FocusNode _focusNode;
  RawKeyEvent _event;

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handlePress(RawKeyEvent event) {
    setState(() {
      _event = event;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HardwareKeyExample'),
      ),
      body: Center(
        child: RawKeyboardListener(
          focusNode: _focusNode,
          onKey: _handlePress,
          child: AnimatedBuilder(
            animation: _focusNode,
            builder: (ctx, child) {
              var textTheme = Theme.of(context).textTheme;
              if (!_focusNode.hasFocus)
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(ctx).requestFocus(_focusNode);
                  },
                  child: Text(
                    'Tap to focus',
                    style: textTheme.display1,
                  ),
                );
              if (_event == null)
                return Text(
                  'Press volume key',
                  style: textTheme.display1,
                );
              int flags;
              int codePoint;
              int keyCode;
              int scanCode;
              int metaState;

              final RawKeyEventData data = _event.data;

              if (data is RawKeyEventDataAndroid) {
                flags = data.flags;
                codePoint = data.codePoint;
                keyCode = data.keyCode;
                scanCode = data.scanCode;
                metaState = data.metaState;
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${_event.runtimeType}', style: textTheme.subhead),
                  Text('flags: $flags', style: textTheme.subhead),
                  Text('codePoint: $codePoint', style: textTheme.subhead),
                  Text('keyCode: $keyCode', style: textTheme.subhead),
                  Text('scanCode: $scanCode', style: textTheme.subhead),
                  Text('metaState: $metaState', style: textTheme.subhead),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
