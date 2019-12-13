import 'package:flutter/material.dart';

class AnimatedIconsExample extends StatefulWidget {
  static const String routeName = '/animatedicons-example';

  @override
  _AnimatedIconsExampleState createState() => _AnimatedIconsExampleState();
}

class _AnimatedIconsExampleState extends State<AnimatedIconsExample>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  bool get _clicked {
    final AnimationStatus status = _animationController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handlePress() {
    _animationController.fling(velocity: _clicked ? -2 : 2);
  }

  Widget _animatedIcon(AnimatedIconData icon, String title) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: AnimatedIcon(
            progress: _animationController,
            icon: icon,
          ),
          onPressed: _handlePress,
        ),
        Text(title),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedIconsExample'),
      ),
      body: ListView(
        children: <Widget>[
          _animatedIcon(AnimatedIcons.add_event, 'Event to add'),
          _animatedIcon(AnimatedIcons.menu_arrow, 'Menu to arrow'),
          _animatedIcon(AnimatedIcons.menu_close, 'Menu to Close'),
          _animatedIcon(AnimatedIcons.search_ellipsis, 'Search to Elipsis'),
          _animatedIcon(AnimatedIcons.event_add, 'Add to event'),
          _animatedIcon(AnimatedIcons.home_menu, "Menu to Home"),
          _animatedIcon(AnimatedIcons.list_view, "View to List"),
          _animatedIcon(AnimatedIcons.menu_arrow, "Arrow to Menu"),
          _animatedIcon(AnimatedIcons.menu_close, "Close to Menu"),
          _animatedIcon(AnimatedIcons.menu_home, "Home to Menu"),
          _animatedIcon(AnimatedIcons.pause_play, "Play to Pause"),
          _animatedIcon(AnimatedIcons.play_pause, "Pause to Play"),
          _animatedIcon(AnimatedIcons.search_ellipsis, "Ellipsis to Search"),
          _animatedIcon(AnimatedIcons.view_list, "List to View"),
        ],
      ),
    );
  }
}
