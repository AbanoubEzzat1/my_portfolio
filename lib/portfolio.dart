import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helpers/strings_manager.dart';
import 'package:my_portfolio/features/home/ui/home_screen.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringsManger.abanoubEzzatProfile,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
