// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SuperInfos? superInfos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Reach Five Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (superInfos != null)
              Text('${superInfos?.info1} + ${superInfos?.info2}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (superInfos != null) {
                  setState(() {
                    superInfos = null;
                  });
                  return;
                }
                try {
                  final result = await search(
                    () => ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Content'))),
                  );
                  setState(() {
                    superInfos = result;
                  });
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      content: Text('$error'),
                    ),
                  );
                }
              },
              child: Text(superInfos == null ? 'Get Infos' : 'Reset Infos'),
            ),
          ],
        ),
      ),
    );
  }
}
