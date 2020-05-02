import 'package:counterstopwatchexample/stopwatch/dependencies.dart';
import 'package:counterstopwatchexample/stopwatch/timer_text.dart';
import 'package:flutter/material.dart';

class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  final Dependencies dependencies = new Dependencies();

  void start() {
    setState(() {
      dependencies.stopwatch.start();
    });
  }

  void stop() {
    setState(() {
      dependencies.stopwatch.stop();
    });
  }

  void reset() {
    setState(() {
      dependencies.stopwatch.reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TimerText(
          dependencies: dependencies,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              onPressed: dependencies.stopwatch.isRunning ? null : start,
              child: Text("Start"),
            ),
            RaisedButton(
              onPressed: dependencies.stopwatch.isRunning ? stop : null,
              child: Text("Stop"),
            ),
            RaisedButton(
              onPressed: reset,
              child: Text("Reset"),
            ),
          ],
        ),
      ],
    );
  }
}
