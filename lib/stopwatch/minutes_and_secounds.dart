import 'package:counterstopwatchexample/stopwatch/dependencies.dart';
import 'package:counterstopwatchexample/stopwatch/elapsed_time.dart';
import 'package:flutter/cupertino.dart';

class MinutesAndSeconds extends StatefulWidget {
  const MinutesAndSeconds({this.dependencies});

  final Dependencies dependencies;

  @override
  MinutesAndSecondsState createState() =>
      MinutesAndSecondsState(dependencies: dependencies);
}

class MinutesAndSecondsState extends State<MinutesAndSeconds> {
  MinutesAndSecondsState({this.dependencies});

  final Dependencies dependencies;

  int minutes = 0;
  int seconds = 0;
  int hours = 0;

  @override
  void initState() {
    dependencies.timerListeners.add(onTick);
    super.initState();
  }

  void onTick(ElapsedTime elapsed) {
    if (elapsed.minutes != minutes ||
        elapsed.seconds != seconds ||
        elapsed.hours != hours) {
      setState(() {
        minutes = elapsed.minutes;
        seconds = elapsed.seconds;
        hours = elapsed.hours;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    final String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    final String hoursStr = (hours % 60).toString().padLeft(2, '0');
    return Text('$hoursStr:$minutesStr:$secondsStr.');
  }
}
