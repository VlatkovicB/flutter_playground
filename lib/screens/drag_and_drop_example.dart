import 'package:flutter/material.dart';

class DragAndDropExample extends StatefulWidget {
  static const String routeName = '/draganddrop-example';

  @override
  _DragAndDropExampleState createState() => _DragAndDropExampleState();
}

class _DragAndDropExampleState extends State<DragAndDropExample> {
  int _position = 1;

  void _moveRect(int position) {
    setState(() {
      _position = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DragAndDropExample'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MovableRect(1, _position, _moveRect),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: MovableRect(2, _position, _moveRect),
              ),
              MovableRect(3, _position, _moveRect),
            ],
          ),
        ],
      ),
    );
  }
}

class Dot extends StatefulWidget {
  const Dot({Key key, this.color, this.size, this.child}) : super(key: key);

  final Color color;
  final double size;
  final Widget child;

  @override
  DotState createState() => DotState();
}

class DotState extends State<Dot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(width: 0.0),
          shape: BoxShape.rectangle),
      child: widget.child,
    );
  }
}

class OutlineRectPainter extends CustomPainter {
  const OutlineRectPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFF000000)
      ..style = PaintingStyle.stroke;
    final Path path = Path();
    final Rect box = Offset.zero & size;

    path.addRect(box);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(OutlineRectPainter oldDelegate) => false;
}

class MovableRect extends StatelessWidget {
  const MovableRect(this.position, this.rectPosition, this.callback);

  final int position;
  final int rectPosition;
  final ValueChanged<int> callback;

  static const double kRectSize = 50.0;

  @override
  Widget build(BuildContext context) {
    final Widget rect = Dot(
      key: GlobalKey(),
      color: Theme.of(context).primaryColor,
      size: kRectSize,
    );

    final Widget outlineRect = Container(
      width: kRectSize,
      height: kRectSize,
      child: const CustomPaint(
        painter: const OutlineRectPainter(),
      ),
    );

    if (position == rectPosition) {
      return Draggable<bool>(
        data: true,
        child: rect,
        childWhenDragging: outlineRect,
        feedback: rect,
        maxSimultaneousDrags: 2,
      );
    } else {
      return DragTarget<bool>(onAccept: (bool data) {
        callback(position);
      }, builder: (context, accepted, rejected) {
        return outlineRect;
      });
    }
  }
}
