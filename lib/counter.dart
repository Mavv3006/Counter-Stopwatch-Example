import 'package:counterstopwatchexample/stopwatch/dependencies.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final Dependencies dependencies = new Dependencies();

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;

  void incCounter() {
    setState(() {
      counter++;
    });
  }

  void decCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 30.0,
        right: 30.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                counter.toString(),
                style: widget.dependencies.textStyle,
              ),
              RaisedButton(
                onPressed: incCounter,
                child: Icon(Icons.add),
              ),
              RaisedButton(
                onPressed: decCounter,
                child: Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
