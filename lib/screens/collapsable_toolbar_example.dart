import 'package:flutter/material.dart';

class CollapsableToolbarExample extends StatelessWidget {
  static const String routeName = '/collapsabletoolbar-example';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150,
            // floating: true,
            pinned: true,
            // snap: true,
            // centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(' Collapsable TabBar '),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Text('FlutterListItems'),
            ),
            itemExtent: 30,
          )
        ],
      ),
    );
  }
}
