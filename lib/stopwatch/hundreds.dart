import 'package:counterstopwatchexample/stopwatch/dependencies.dart';
import 'package:counterstopwatchexample/stopwatch/elapsed_time.dart';
import 'package:flutter/material.dart';

class Hundreds extends StatefulWidget {
  const Hundreds({Key key, this.dependencies}) : super(key: key);

  final Dependencies dependencies;

  @override
  _HundredsState createState() => _HundredsState(dependencies);
}

class _HundredsState extends State<Hundreds> {
  _HundredsState(this.dependencies);

  final Dependencies dependencies;

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
    return Text(hundredsString);
  }
}
