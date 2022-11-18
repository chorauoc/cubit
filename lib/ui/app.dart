import 'package:flutter/material.dart';
class App extends StatelessWidget {
  final Widget child;
  const App({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Price Tracker")),
      body: child,
    );
  }
}
