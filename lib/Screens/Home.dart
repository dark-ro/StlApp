// ignore_for_file: file_names

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:styliste/Services/Services.dart';
import 'package:styliste/Users/User.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserService _userService = UserService();
  final StylisteUser _stylisteUser = StylisteUser();

  final _formKey = GlobalKey<FormState>();
  //RegExp emailRegex = RegExp(r"[^a-z0-9\._-]\+[a-z]+");
  final RegExp emailRegex = RegExp(r"[a-z0-9\_-]+@([a-z]+\.)+[a-z]");

  String _email = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/styliste2.jpeg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                      validator: (value) =>
                          value!.isEmpty || !emailRegex.hasMatch(value)
                              ? 'Please enter a valid email'
                              : null,
                      decoration: const InputDecoration(
                          focusColor: Colors.white,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          labelText: 'Entrer votre email',
                          labelStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.amber,
                          filled: true),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // TextFormField(
                    //   decoration: const InputDecoration(
                    //       border: OutlineInputBorder(),
                    //       labelText: 'Entrer le nom de votre société'),
                    // ),
                    // const SizedBox(
                    //   height: 40,
                    // ),
                    TextFormField(
                      cursorColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        hintText: 'Entrer un mot de passe',
                        fillColor: Colors.amber,
                        filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: !emailRegex.hasMatch(_email)
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                print(_email);
                                (_userService.auth(StylisteUser(
                                  email: _email,
                                  password: _password,
                                )));
                              }
                              _stylisteUser.toJson();
                            },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        padding: const EdgeInsets.fromLTRB(60, 15, 60, 15),
                      ),
                      child: const Text(
                        'Email',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
