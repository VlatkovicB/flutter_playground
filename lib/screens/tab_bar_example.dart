import 'package:flutter/material.dart';

class TabBarExample extends StatelessWidget  {
  static const String routeName = '/tabbar-example';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab Bar with Tab Bar View'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Tab 1',
              ),
              Tab(
                text: 'Tab 2',
              ),
              Tab(
                text: 'Tab 3',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              color: Colors.indigoAccent,
            ),
            Container(
              color: Colors.redAccent,
            ),
            Container(
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
