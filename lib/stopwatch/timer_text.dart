import 'dart:async';

import 'package:counterstopwatchexample/stopwatch/dependencies.dart';
import 'package:counterstopwatchexample/stopwatch/elapsed_time.dart';
import 'package:counterstopwatchexample/stopwatch/hundreds.dart';
import 'package:counterstopwatchexample/stopwatch/minutes_and_secounds.dart';
import 'package:flutter/material.dart';

class TimerText extends StatefulWidget {
  const TimerText({this.dependencies});

  final Dependencies dependencies;

  @override
  TimerTextState createState() =>
      TimerTextState(dependencies: dependencies);
}

class TimerTextState extends State<TimerText> {
  TimerTextState({this.dependencies});

  final Dependencies dependencies;
  Timer timer;
  int milliseconds;

  @override
  void initState() {
    timer = Timer.periodic(
      Duration(milliseconds: dependencies.timerMillisecondsRefreshRate),
      callback,
    );
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  void callback(Timer timer) {
    if (milliseconds != dependencies.stopwatch.elapsedMilliseconds) {
      milliseconds = dependencies.stopwatch.elapsedMilliseconds;
      final int hundreds = (milliseconds / 10).truncate();
      final int seconds = (hundreds / 100).truncate();
      final int minutes = (seconds / 60).truncate();
      final int hours = (minutes / 60).truncate();
      final ElapsedTime elapsedTime = ElapsedTime(
        hundreds: hundreds,
        seconds: seconds,
        minutes: minutes,
        hours: hours,
      );
      for (final ValueChanged<ElapsedTime> listener in dependencies
          .timerListeners) {
        listener(elapsedTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RepaintBoundary(
          child: MinutesAndSeconds(dependencies: dependencies),
        ),
        RepaintBoundary(
          child: Hundreds(dependencies: dependencies),
        ),
      ],
    );
  }
}
