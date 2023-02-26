import 'package:flutter/material.dart';
import 'widget/result_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Results',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Results'),
        ),
        body: Center(
          child: ResultChart.withSampleData(),
        ),
      ),
    );
  }
}
