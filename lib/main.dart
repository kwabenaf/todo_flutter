import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tut_todo/pages/home.dart';
import 'package:tut_todo/constants/constants.dart';

void main() async {
  // Initialize Hive for Flutter
  await Hive.initFlutter();

  // Open a Hive box (a local storage container)
  var box = await Hive.openBox(hiveBoxName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo',
      home: const Home(), // Set the Home widget as the initial screen
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: tdpurp),
        useMaterial3: true,
      ),
    );
  }
}
