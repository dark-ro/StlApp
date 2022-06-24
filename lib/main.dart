import 'package:flutter/material.dart';
import 'package:styliste/Screens/Home.dart';
import 'package:styliste/Screens/List.dart';
import 'package:styliste/Screens/Save.dart';
import 'package:styliste/Screens/accueil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // final bool value = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Accueil(),
    );
  }
}
