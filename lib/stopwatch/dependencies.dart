import 'package:counterstopwatchexample/stopwatch/elapsed_time.dart';
import 'package:flutter/material.dart';

class Dependencies {
  final List<ValueChanged<ElapsedTime>> timerListeners = <ValueChanged<ElapsedTime>>[];
  final Stopwatch stopwatch = Stopwatch();
  final int timerMillisecondsRefreshRate = 30;
}