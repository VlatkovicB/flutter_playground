import 'package:flutter/material.dart';

class AboutListTileExample extends StatelessWidget {
  static const String routeName = '/aboutlisttile-example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AboutListTileExample'),
      ),
      body: AboutListTile(
        icon: FlutterLogo(),
        child: Text("About"),
        aboutBoxChildren: <Widget>[
          Text("Playground app for Flutter. Contains list of examples."),
        ],
        applicationIcon: FlutterLogo(),
        applicationName: "Flutter Playground",
        applicationVersion: "1.0.0",
      ),
    );
  }
}
