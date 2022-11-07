import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String myTitle = "Habit Tracker";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: myTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            myTitle,
            style: TextStyle(fontSize: 30, color: Colors.orange),
          ),
        ),
      ),
    );
  }
}
