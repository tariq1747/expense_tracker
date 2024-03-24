import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String route = '/splash';

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Column(
          children: [
            FlutterLogo(),
            SizedBox(height: 30),
            Text('Flutter'),
          ],
        ),
      );
}
