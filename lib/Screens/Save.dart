// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:styliste/Screens/List.dart';
import 'package:styliste/Screens/accueil.dart';
import 'package:styliste/Users/Person.dart';

class Save extends StatefulWidget {
  bool Onpage;
  Save({Key? key, required this.Onpage}) : super(key: key);

  @override
  State<Save> createState() => _SaveState();
}

class _SaveState extends State<Save> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool value = true;
  bool OnSave = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SaveInput(),
        ),
      ),
      bottomNavigationBar:
          BottomNavigationBar(backgroundColor: Colors.amber, items: [
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => Accueil(
                                Onpage: value,
                              ))));
                },
                icon: Icon(Icons.home,
                    color: value ? Colors.black : Colors.white)),
            label: ''),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: !OnSave
                  ? () {
                      print('$value');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Save(Onpage: value))));
                    }
                  : () => print('Vous êtes déjà sur cette page'),
              icon: Icon(Icons.person_add_alt_1,
                  color: value ? Colors.white : Colors.black),
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => ClientList(
                              Onpage: value,
                            ))));
              },
              icon:
                  Icon(Icons.list, color: value ? Colors.black : Colors.white),
            ),
            label: ''),
      ]),
    );
  }
}

class SaveInput extends StatelessWidget {
  SaveInput({Key? key}) : super(key: key);

  final _person = Person(Nom: '', like: false);

  // final String Nom = '';
  // String Taille = '';
  // String Longueur = '';
  // String Poitrine = '';
  // String Jambe = '';
  // String Bras = '';
  // String Cuisse = '';
  // String Dos = '';
  // final person = <String, dynamic>{
  //   "Nom": Nom,
  //   'taille': Taille,
  // };
  Future Send() async {
    _person.like = false;
    final firestore = FirebaseFirestore.instance;
    firestore.collection('users').add(_person.toJson()).then(
        (DocumentReference doc) =>
            print('Personne ajoutée avec ID : ${doc.id}'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.only(top: 100, bottom: 20, left: 20, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFormField(
            onChanged: (value) {
              _person.Nom = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nom',
              labelStyle: TextStyle(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) {
              _person.Taille = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Taille',
              labelStyle: TextStyle(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) {
              _person.Longueur = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Longueur',
              labelStyle: TextStyle(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) {
              _person.Poitrine = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Poitrine',
              labelStyle: TextStyle(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) {
              _person.Jambe = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Jambe',
              labelStyle: TextStyle(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) {
              _person.Bras = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Bras',
              labelStyle: TextStyle(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) {
              _person.Cuisse = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Cuisse',
              labelStyle: TextStyle(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) {
              _person.Dos = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Dos',
              labelStyle: TextStyle(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (_person.Nom != null &&
                  _person.Bras != null &&
                  _person.Cuisse != null &&
                  _person.Dos != null &&
                  _person.Jambe != null &&
                  _person.Longueur != null &&
                  _person.Poitrine != null &&
                  _person.Taille != null) {
                Send().whenComplete(() => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: AlertDialog(
                            title: Text('Sauvegarder avec succes'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'))
                            ],
                            backgroundColor: Colors.amber),
                      );
                    }));
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'))
                        ],
                        title: Text('Veuillez remplir les champs vides'),
                      );
                    });
              }
            },
            style: ElevatedButton.styleFrom(
                //elevation: 0,
                primary: Colors.amber,
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 15)),
            child: const Text(
              'Sauvegarder',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class bottomSection extends StatelessWidget {
  const bottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(backgroundColor: Colors.amber, items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.black), label: ''),
      BottomNavigationBarItem(
          icon: Icon(Icons.person_add_alt_1, color: Colors.black), label: ''),
      BottomNavigationBarItem(
          icon: Icon(Icons.list, color: Colors.black), label: ''),
    ]);
  }
}
