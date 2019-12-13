import 'package:flutter/material.dart';

import '../imports.dart';

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
            title: "TabBar Example",
          ),
          MenuButton(
            routeName: CollapsableToolbarExample.routeName,
            title: "Collapsable TabBar Example",
          ),
        ],
      ),
    );
  }
}
