import 'package:flutter/material.dart';
import 'package:list_app/screens/home_screen.dart';
import 'package:list_app/screens/home_screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
