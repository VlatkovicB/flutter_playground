import 'package:flutter/material.dart';

class AppBarExample extends StatelessWidget {
  static const String routeName = '/appbar-example';

  @override
  Widget build(BuildContext context) {
    final title = Text('Title');
    const margin = const EdgeInsets.only(top: 10, bottom: 10);
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar Examples'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: margin,
            child: AppBar(
              title: title,
              backgroundColor: Theme.of(context).accentColor,
              elevation: 5,
            ),
          ),
          Container(
            margin: margin,
            child: AppBar(
              title: title,
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings),
                )
              ],
            ),
          ),
          Container(
            margin: margin,
            child: AppBar(
              title: title,
              centerTitle: true,
            ),
          ),
          Container(
            margin: margin,
            child: AppBar(
              title: title,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
              ],
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              textTheme: TextTheme(
                title: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            margin: margin,
            child: AppBar(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Subtitle',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: AppBar(
              title: Row(
                children: <Widget>[
                  FlutterLogo(),
                  SizedBox(
                    width: 10,
                  ),
                  title,
                ],
              ),
              backgroundColor: Theme.of(context).accentColor,
            ),
          ),
          Container(
            margin: margin,
            child: AppBar(
              elevation: 1,
              title: title,
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
