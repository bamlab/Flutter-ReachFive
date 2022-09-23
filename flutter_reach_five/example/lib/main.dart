import 'package:flutter/material.dart';

import 'const.dart';
import 'views/reach_five_methods_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Reach Five Example')),
        body: ReachFiveMethodsView(
          dataSet: DataSets.firstDataSet,
        ),
      ),
    );
  }
}
