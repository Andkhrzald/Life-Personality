import 'package:flutter/material.dart';
import 'pages/home_page.dart';

class LifeManagerApp extends StatelessWidget {
  const LifeManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Life Manager',
      home: const HomePage(),
    );
  }
}
