import 'package:flutter/material.dart';

import '../const.dart';
import 'reach_five_methods_view.dart';

class ReachFiveInstancesView extends StatelessWidget {
  const ReachFiveInstancesView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: DataSets.dataSets.map((dataSet) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Flutter Reach Five Example \n ${dataSet.name}'),
          ),
          body: ReachFiveMethodsView(
            dataSet: dataSet,
          ),
        );
      }).toList(),
    );
  }
}
