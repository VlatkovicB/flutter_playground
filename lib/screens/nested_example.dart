import 'package:flutter/material.dart';

class NestedExample extends StatelessWidget {
  static const String routeName = '/nested-example';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NestedExample'),
      ),
      body: ListView.builder(
        itemCount: 5,
        primary: true,
        itemBuilder: (ctx, index) => Container(
          height: MediaQuery.of(context).size.height * 0.12,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (ctx, index) => Container(
              width: MediaQuery.of(context).size.height * 0.10,
              child: ListTile(
                title: Text(
                  index.toString(),
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
