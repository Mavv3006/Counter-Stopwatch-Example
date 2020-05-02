import 'package:counterstopwatchexample/stopwatch.dart';
import 'package:flutter/material.dart';

import 'counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Stopwatch Counter Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> list = [];
  String newTitle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 12,
            child: ListView.separated(
              itemBuilder: (context, index) => list.elementAt(index),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
              itemCount: list.length,
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(
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
                      child: Text("Add Counter"),
                    ),
                    RaisedButton(
                      onPressed: addStopwatch,
                      child: Text("Add Stopwatch"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: list.length > 0 ? removeLast : null,
                      child: Text("Remove Last"),
                    ),
                    RaisedButton(
                      onPressed: list.length > 0 ? removeAll : null,
                      child: Text("Remove All"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
      list = [];
    });
  }
}
