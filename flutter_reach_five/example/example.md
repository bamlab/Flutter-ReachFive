```dart

void main() => runApp(const MyExampleApp());

class MyExampleApp extends StatelessWidget {
  const MyExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ReachFive>(
      future: ReachFiveManager.initialize(
        sdkConfig: const SdkConfig(
          domain: 'YOUR_DOMAIN',
          clientId: 'YOUR_CLIENT_ID',
          scheme: 'YOUR_SCHEME',
        ),
      ),
      builder: (context, snapshot) {
        final reachFive = snapshot.data;
        if (reachFive != null) {
          // You can use your reachFive method here
          // Here is an example with loginWithPassword
          // Check the others methods in the doc or in the example repo
          return Column(
            children: [
              ElevatedButton(
                onPressed: () async => reachFive.loginWithPassword(
                  password: 'YOUR_PASSWORD',
                  email: 'YOUR_EMAIL',
                ),
                child: const Text('Login with password'),
              )
            ],
          );
        }

        if (snapshot.hasError) {
          return const Text('handle your initialization error here');
        }

        return const Text('Loading');
      },
    );
  }
}
```
