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
  ReachFive? reachFive;

  @override
  Widget build(BuildContext context) {
    final reachFive = this.reachFive;

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Reach Five Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (reachFive != null)
              Text(
                // ignore: lines_longer_than_80_chars
                '${reachFive.config.domain} + ${reachFive.config.clientId} + ${reachFive.config.scheme}',
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (reachFive != null) {
                  setState(() {
                    this.reachFive = null;
                  });
                  return;
                }

                try {
                  final result = await ReachFiveManager.initialize(
                    const ReachFiveConfig(
                      domain: 'domain',
                      clientId: 'clientId',
                      scheme: 'scheme',
                    ),
                  );
                  setState(() {
                    this.reachFive = result;
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
              child: Text(reachFive == null ? 'Get Infos' : 'Reset Infos'),
            ),
          ],
        ),
      ),
    );
  }
}
