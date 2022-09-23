import 'package:flutter/material.dart';

import 'views/reach_five_instances_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ReachFiveInstancesView(),
    );
  }
}
