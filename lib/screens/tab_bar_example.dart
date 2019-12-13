import 'package:flutter/material.dart';

class TabBarExample extends StatefulWidget {
  static const String routeName = '/tabbar-example';

  @override
  _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
            controller: _tabController,
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
