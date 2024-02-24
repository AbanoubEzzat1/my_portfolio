import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(child: Text("Home Screen")),
      )),
    );
  }
}
