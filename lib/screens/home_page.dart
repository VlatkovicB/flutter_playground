import 'package:flutter/material.dart';

import '../imports.dart';

enum View { List, Grid }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  View _view = View.List;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300), value: 1);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  final _children = <Widget>[
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
    MenuButton(
        routeName: BottomNavigationExample.routeName,
        title: "BottomNavigation with Page View")
  ];

  void _toggleView() {
    setState(() {
      if (_view == View.List) {
        _animationController.forward();
        _view = View.Grid;
      } else {
        _animationController.reverse();
        _view = View.List;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.list_view,
              progress: _animationController,
            ),
            onPressed: _toggleView,
          ),
        ],
      ),
      body: _view == View.List
          ? ListView(
              children: _children,
            )
          : GridView(
              children: _children,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
              ),
            ),
    );
  }
}
