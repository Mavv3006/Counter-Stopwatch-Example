import 'package:counterstopwatchexample/counter.dart';
import 'package:counterstopwatchexample/stopwatch.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          body1: TextStyle(fontSize: 30.0),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stopwatch Counter Example'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> list = <Widget>[];

  void addCounter() {
    setState(() {
      list.add(Counter());
    });
  }

  void addStopwatch() {
    setState(() {
      list.add(Stopwatch());
    });
  }

  void removeLast() {
    setState(() {
      list.removeLast();
    });
  }

  void removeAll() {
    setState(() {
      list = <Widget>[];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 12,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) =>
                list.elementAt(index),
            separatorBuilder: (BuildContext context, int index) =>
                Divider(
                  color: Colors.grey,
                ),
            itemCount: list.length,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: const Offset(
                  0.0,
                  -2.0,
                ),
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: addCounter,
                    child: const Text('Add Counter'),
                  ),
                  RaisedButton(
                    onPressed: addStopwatch,
                    child: const Text('Add Stopwatch'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: list.isNotEmpty ? removeLast : null,
                    child: const Text('Remove Last'),
                  ),
                  RaisedButton(
                    onPressed: list.isNotEmpty ? removeAll : null,
                    child: const Text('Remove All'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
