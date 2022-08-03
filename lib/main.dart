import 'package:flutter/material.dart';
import 'package:styliste/Screens/Details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:styliste/Screens/Home.dart';
import 'package:styliste/Screens/List.dart';
import 'package:styliste/Screens/Save.dart';
import 'package:styliste/Screens/accueil.dart';
import 'package:styliste/Services/Services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  UserService _userService = UserService();
  bool Onpage = true;
  //const MyApp({Key? key}) : super(key: key);

  // final bool value = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: _userService.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return Accueil(
                Onpage: Onpage,
              );
            }
          }
          return Home();
        },
      ),
    );
  }
}
