import 'package:flutter/material.dart';

import '../constants.dart';

class NavigationDrawerExample extends StatefulWidget {
  static const String routeName = '/navigation-drawer-example';

  @override
  _NavigationDrawerExampleState createState() =>
      _NavigationDrawerExampleState();
}

class _NavigationDrawerExampleState extends State<NavigationDrawerExample> {
  bool _details = true;
  String _title = "Navigation example";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Drawer Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_title),
            BackButton(),
          ],
        ),
      ),
      drawer: _leftDrawer(context),
      endDrawer: _rightDrawer(context),
    );
  }

  Drawer _leftDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                _accountAvatar(context),
                Text(
                  'Flutter Example',
                  style: TextStyle(
                    fontFamily: Constants.ROBOTO_REGULAR,
                  ),
                ),
                Text(
                  'flutterexample@gmail.com',
                  style: TextStyle(
                    fontFamily: Constants.ROBOTO_REGULAR,
                  ),
                ),
              ],
            ),
          ),
          _drawerListTiles(Icons.linked_camera, 'Import'),
          _drawerListTiles(Icons.photo, 'Gallery'),
          _drawerListTiles(Icons.slideshow, 'Slideshow'),
          _drawerListTiles(Icons.build, 'Tools'),
          Divider(),
          _drawerListTiles(Icons.share, 'Share'),
          _drawerListTiles(Icons.send, 'Send'),
        ],
      ),
    );
  }

  Drawer _rightDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Flutter example'),
            accountEmail: Text("flutterexample@gmail.com"),
            currentAccountPicture: _accountAvatar(context),
            otherAccountsPictures: <Widget>[
              _accountAvatar(context),
              _accountAvatar(context),
              _accountAvatar(context),
            ],
            onDetailsPressed: () {
              setState(() {
                _details = !_details;
              });
            },
          ),
          Offstage(
            offstage: !_details,
            child: Column(
              children: <Widget>[
                _drawerListTiles(Icons.linked_camera, 'Import'),
                _drawerListTiles(Icons.photo, 'Gallery'),
                _drawerListTiles(Icons.slideshow, 'Slideshow'),
                _drawerListTiles(Icons.build, 'Tools'),
                Divider(),
                _drawerListTiles(Icons.share, 'Share'),
                _drawerListTiles(Icons.send, 'Send'),
              ],
            ),
          ),
          Offstage(
            offstage: _details,
            child: Column(
              children: <Widget>[
                _drawerAccountTile(context),
                _drawerAccountTile(context),
                _drawerAccountTile(context),
                _drawerAccountTile(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _drawerListTiles(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: Constants.ROBOTO_BOLD,
          fontSize: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _title = title;
          Navigator.pop(context);
        });
      },
    );
  }

  Widget _drawerAccountTile(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).accentColor,
        child: FlutterLogo(),
      ),
      title: Text(
        'flutterexample@gmail.com',
        style: TextStyle(
          fontFamily: Constants.ROBOTO_BOLD,
        ),
      ),
    );
  }

  Widget _accountAvatar(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).accentColor,
      child: FlutterLogo(),
    );
  }
}
