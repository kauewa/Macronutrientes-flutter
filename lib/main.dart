import 'package:flutter/material.dart';
import 'package:macronutrientes/data/inherited.dart';
import 'package:macronutrientes/screen/initial.dart';


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
      home: InfosWidget(child: InitialWidget()),
    );
  }
}

