import 'package:flutter/material.dart';

import 'imports.dart';

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
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        AppBarExample.routeName: (ctx) => AppBarExample(),
        NavigationDrawerExample.routeName: (ctx) => NavigationDrawerExample(),
        TabBarExample.routeName: (ctx) => TabBarExample(),
        CollapsableToolbarExample.routeName: (ctx) =>
            CollapsableToolbarExample(),
        BottomNavigationExample.routeName: (ctx) => BottomNavigationExample(),
        AnimatedIconsExample.routeName: (ctx) => AnimatedIconsExample(),
        AnimatedSizeExample.routeName: (ctx) => AnimatedSizeExample(),
        ProgressButtonExample.routeName: (ctx) => ProgressButtonExample(),
        StaggerAnimationsExample.routeName: (ctx) => StaggerAnimationsExample(),
        StepperExample.routeName: (ctx) => StepperExample(),
        HardwareKeyExample.routeName: (ctx) => HardwareKeyExample(),
        GridPaperExample.routeName: (ctx) => GridPaperExample(),
        AnimatedSwitcherExample.routeName: (ctx) => AnimatedSwitcherExample(),
        DragAndDropExample.routeName: (ctx) => DragAndDropExample(),
        FlowWidgetExample.routeName: (ctx) => FlowWidgetExample(),
        ExpansionTileExample.routeName: (ctx) => ExpansionTileExample(),
        AboutListTileExample.routeName: (ctx) => AboutListTileExample(),
        LifecycleExample.routeName: (ctx) => LifecycleExample(),
        RotatedBoxExample.routeName: (ctx) => RotatedBoxExample(),
        NestedExample.routeName: (ctx) => NestedExample(),
        TimerPickerExample.routeName: (ctx) => TimerPickerExample(),
        ActionSheetExample.routeName: (ctx) => ActionSheetExample(),
        ProgressIndicatorExample.routeName: (ctx) => ProgressIndicatorExample(),
      },
    );
  }
}
