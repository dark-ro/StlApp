import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:styliste/Screens/Save.dart';
import 'package:styliste/Users/Person.dart';

class Details extends StatefulWidget {
  Map<String, dynamic> data;
  DocumentSnapshot document;
  Details({Key? key, required this.data, required this.document})
      : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final _person = Person(Nom: '', like: false);
  String dropdownvalue = 'Taille';
  String Modify = '';
  List mesureSelected = [
    'Taille',
    'Hauteur',
    'Jambe',
    'Poitrine',
    'Longueur',
    'Bras',
    'Hanche'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              //color: Colors.amber,
              padding: const EdgeInsets.only(bottom: 0),
              child: const Center(
                child: Icon(
                  Icons.person,
                  size: 300,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, top: 0),
              child: Text(
                widget.data['Nom'],
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 10,
                              color: Colors.black)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text(
                            widget.data['Taille'],
                            style: const TextStyle(fontSize: 40),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Taille',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 10,
                              color: Colors.black)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text(
                            widget.data['Longueur'],
                            style: const TextStyle(fontSize: 40),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Longueur',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 10,
                              color: Colors.black)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text(
                            widget.data['Poitrine'],
                            style: const TextStyle(fontSize: 40),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Poitrine',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  )
                  // Mesures(),
                  // Mesures(),
                  // Mesures(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 10,
                              color: Colors.black)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text(
                            widget.data['Jambe'],
                            style: const TextStyle(fontSize: 40),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Jambe',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 10,
                              color: Colors.black)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text(
                            widget.data['Bras'],
                            style: const TextStyle(fontSize: 40),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Bras',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 10,
                              color: Colors.black)
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text(
                            widget.data['Cuisse'],
                            style: const TextStyle(fontSize: 40),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Cuisse',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  )
                  // Mesures(),
                  // Mesures(),
                  // Mesures(),
                ],
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(bottom: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       // Mesures(),
            //       // Mesures(),
            //     ],
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 400,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      color: Colors.black)
                                ],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: SingleChildScrollView(
                              child: Form(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        onChanged: ((value) {
                                          setState(() {
                                            Modify = value;
                                          });
                                        }),
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder()),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 30, bottom: 40),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(widget.document.id)
                                                  .update({
                                                dropdownvalue: Modify
                                              }).then((value) => print(
                                                      "Update sucessfuly"));
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.amber,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      80, 20, 80, 20)),
                                          child: const Text('Sauvegarder'),
                                        ),
                                      ),
                                      DropdownButton<String>(
                                        value: dropdownvalue,
                                        icon: const Icon(Icons.arrow_downward),
                                        // ignore: non_constant_identifier_names
                                        onChanged: (String? NewValue) {
                                          setState(() {
                                            dropdownvalue = NewValue!;
                                          });
                                        },
                                        elevation: 16,
                                        items: <String>[
                                          'Taille',
                                          'Hanche',
                                          'Longueur',
                                          'Bras',
                                          'Jambe',
                                          'Hauteur',
                                          'Poitrine'
                                        ].map<DropdownMenuItem<String>>(
                                            (value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.fromLTRB(50, 15, 50, 15)),
                  child: const Text('Modifier',
                      style: TextStyle(color: Colors.black))
                  // ButtonStyle(
                  //   shape: MaterialStateProperty.all(
                  //     RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //   ),
                  // ),
                  ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: const bottomSection(),
    );
  }
}

class Mesures extends StatelessWidget {
  const Mesures({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(spreadRadius: 1, blurRadius: 10, color: Colors.black)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Center(
            child: Text(
              '75',
              style: TextStyle(fontSize: 40),
            ),
          ),
          Center(
            child: Text(
              'Taille',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

class ButtonSelection extends StatefulWidget {
  ButtonSelection({Key? key}) : super(key: key);

  @override
  State<ButtonSelection> createState() => _ButtonSelectionState();
}

class _ButtonSelectionState extends State<ButtonSelection> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'Taille';
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
