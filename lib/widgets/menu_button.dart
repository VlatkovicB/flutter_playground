import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String routeName;
  final String title;

  MenuButton({
    @required this.routeName,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 4,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(routeName);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                    child: Text(title),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.chevron_right,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
