import 'package:flutter/material.dart';

class StepperExample extends StatefulWidget {
  static const String routeName = '/stepper-example';

  @override
  _StepperExampleState createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _step = 0;
  List<Step> _steps = [
    Step(
      content: Text('First step'),
      title: Text("Step one"),
      isActive: true,
    ),
    Step(
      content: Text('Second step'),
      title: Text("Step two something something"),
      isActive: true,
    ),
    Step(
      content: Text('Third step'),
      title: Text("Something third step is the key."),
      isActive: true,
    ),
    Step(
      content: Wrap(
        spacing: 4,
        runSpacing: 4,
        direction: Axis.horizontal,
        children: <Widget>[
          Chip(
            label: Text('Chip1'),
          ),
          Chip(
            label: Text('Chip2'),
          ),
          Chip(
            label: Text('Chip31'),
          ),
          Chip(
            label: Text('Chip14'),
          ),
        ],
      ),
      title: Text("Stepping on the four."),
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperExample'),
      ),
      body: Stepper(
        currentStep: _step,
        steps: _steps,
        type: StepperType.vertical,
        onStepTapped: (step) {
          setState(() {
            _step = step;
          });
        },
        onStepCancel: () {
          setState(() {
            if (_step > 0) {
              _step--;
            }
          });
        },
        onStepContinue: () {
          setState(() {
            if (_step < _steps.length - 1) {
              _step++;
            }
          });
        },
      ),
    );
  }
}
