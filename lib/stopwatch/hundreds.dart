import 'package:counterstopwatchexample/stopwatch/dependencies.dart';
import 'package:counterstopwatchexample/stopwatch/elapsed_time.dart';
import 'package:flutter/material.dart';

class Hundreds extends StatefulWidget {
  final Dependencies dependencies;

  const Hundreds({Key key, this.dependencies}) : super(key: key);

  @override
  _HundredsState createState() => _HundredsState(dependencies);
}

class _HundredsState extends State<Hundreds> {
  final Dependencies dependencies;

  _HundredsState(this.dependencies);

  int hundreds = 0;

  @override
  void initState() {
    dependencies.timerListeners.add(onTick);
    super.initState();
  }

  void onTick(ElapsedTime elapsedTime) {
    if (elapsedTime.hundreds != hundreds) {
      setState(() {
        hundreds = elapsedTime.hundreds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String hundredsString = (hundreds % 100).toString().padLeft(2, '0');
    return new Text(
      hundredsString,
      style: dependencies.textStyle,
    );
  }
}
