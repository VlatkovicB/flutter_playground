import 'package:flutter/material.dart';

class DismissableExample extends StatelessWidget {
  static const String routeName = '/dismissable-example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DismissableExample'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) {
            print(index);
          },
          background: Container(
            color: Colors.red,
          ),
          direction: DismissDirection.horizontal,
          movementDuration: Duration(seconds: 1),
          secondaryBackground: Container(
            color: Colors.yellow,
          ),
          key: Key(index.toString()),
          child: ListTile(
            leading: FlutterLogo(),
            title: Text("Flutter + $index"),
          ),
        ),
      ),
    );
  }
}
