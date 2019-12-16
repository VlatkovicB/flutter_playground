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
    // MenuButton(
    //   routeName: AppBarExample.routeName,
    //   title: "App Bar",
    // ),
    // MenuButton(
    //   routeName: NavigationDrawerExample.routeName,
    //   title: "Navigation Drawer",
    // ),
    // MenuButton(
    //   routeName: TabBarExample.routeName,
    //   title: "TabBar Example",
    // ),
    // MenuButton(
    //   routeName: CollapsableToolbarExample.routeName,
    //   title: "Collapsable TabBar Example",
    // ),
    // MenuButton(
    //     routeName: BottomNavigationExample.routeName,
    //     title: "BottomNavigation with Page View"),
    // MenuButton(
    //     routeName: AnimatedIconsExample.routeName,
    //     title: "Animated Icons Example"),
    // MenuButton(
    //     routeName: AnimatedSizeExample.routeName,
    //     title: "Animated Size Example"),
    // MenuButton(
    //     routeName: ProgressButtonExample.routeName,
    //     title: "Progress Button Example"),
    // MenuButton(
    //     routeName: StaggerAnimationsExample.routeName,
    //     title: "Stagger Animations Example"),
    // MenuButton(routeName: StepperExample.routeName, title: "Stepper Example"),
    MenuButton(
        routeName: HardwareKeyExample.routeName, title: 'HardwareKey example'),
    MenuButton(
        routeName: GridPaperExample.routeName, title: 'GridPaper Example'),
    MenuButton(
        routeName: AnimatedSwitcherExample.routeName,
        title: 'AnimatedSwitcher exmaple'),
    MenuButton(
        routeName: DragAndDropExample.routeName, title: 'DragAndDrop Example'),
    MenuButton(
        routeName: FlowWidgetExample.routeName, title: 'FlowWidget Example'),
    MenuButton(
        routeName: ExpansionTileExample.routeName,
        title: 'ExpansionTile Example'),
    MenuButton(
        routeName: AboutListTileExample.routeName,
        title: 'AboutListTile Example'),
    MenuButton(
        routeName: LifecycleExample.routeName, title: 'Lifecycle Example'),
    MenuButton(
        routeName: RotatedBoxExample.routeName, title: 'RotatedBox Example'),
    MenuButton(routeName: NestedExample.routeName, title: 'Nested Example'),
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
