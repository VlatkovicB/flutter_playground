import 'package:flutter/material.dart';

import 'appbar_example.dart';
import 'tab_bar_example.dart';
import '../widgets/menu_button.dart';
import 'navigation_drawer_example.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: <Widget>[
          MenuButton(
            routeName: AppBarExample.routeName,
            title: "App Bar",
          ),
          MenuButton(
            routeName: NavigationDrawerExample.routeName,
            title: "Navigation Drawer",
          ),
          MenuButton(
            routeName: TabBarExample.routeName,
            title: "Tab Bar Example",
          ),
        ],
      ),
    );
  }
}
