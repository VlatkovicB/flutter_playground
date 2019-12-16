import 'package:flutter/material.dart';

class FlowWidgetExample extends StatefulWidget {
  static const String routeName = '/flowidget-example';

  @override
  FlowWidgetExampleState createState() {
    return FlowWidgetExampleState();
  }
}

class FlowWidgetExampleState extends State<FlowWidgetExample>
    with TickerProviderStateMixin {
  AnimationController start;

  @override
  void initState() {
    super.initState();
    start = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
      lowerBound: 1,
      upperBound: 10,
    );
    // start = AnimationController.unbounded(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlowWidget Example'),
      ),
      body: Container(
        child: Flow(
          delegate: ExampleFlowDelegate(startOffset: start),
          children: [
            _buildBox(0, Colors.red),
            _buildBox(1, Colors.deepPurple),
            _buildBox(2, Colors.brown),
            _buildBox(3, Colors.orange),
            _buildBox(4, Colors.blueGrey),
            _buildBox(5, Colors.cyan),
            _buildBox(6, Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(int index, MaterialColor color) {
    return GestureDetector(
      onTap: () {
        start.reverse();
      },
      onDoubleTap: () {
        start.forward();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).viewInsets.top -
                MediaQuery.of(context).viewInsets.bottom -
                AppBar().preferredSize.height) *
            1 /
            7,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black, width: 1),
          boxShadow: [BoxShadow(blurRadius: 2)],
        ),
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text('$index'),
            ),
          ),
        ),
      ),
    );
  }
}

class ExampleFlowDelegate extends FlowDelegate {
  ExampleFlowDelegate({this.startOffset}) : super(repaint: startOffset);

  final Animation<double> startOffset;

  @override
  void paintChildren(FlowPaintingContext context) {
    double dy = 0;

    for (int i = 0; i < context.childCount; ++i) {
      dy = i * context.getChildSize(i).height;

      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          0.0,
          dy * 0.1 * startOffset.value,
          0.0,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(ExampleFlowDelegate oldDelegate) =>
      startOffset != oldDelegate.startOffset;
}
