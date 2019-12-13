import 'package:flutter/material.dart';

import 'constants.dart';
import './screens/home_page.dart';
import './screens/appbar_example.dart';
import './screens/navigation_drawer_example.dart';
import './screens/tab_bar_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.cyanAccent,
        fontFamily: Constants.ROBOTO_REGULAR,
      ),
      home: HomePage(),
      routes: {
        AppBarExample.routeName: (ctx) => AppBarExample(),
        NavigationDrawerExample.routeName: (ctx) => NavigationDrawerExample(),
        TabBarExample.routeName: (ctx) => TabBarExample(),
      },
    );
  }
}
