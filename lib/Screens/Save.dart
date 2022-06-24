// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:styliste/Screens/List.dart';
import 'package:styliste/Screens/accueil.dart';

class Save extends StatefulWidget {
  bool Onpage;
  Save({Key? key, required this.Onpage}) : super(key: key);

  @override
  State<Save> createState() => _SaveState();
}

class _SaveState extends State<Save> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: const SaveInput(),
        ),
      ),
      bottomNavigationBar:
          BottomNavigationBar(backgroundColor: Colors.amber, items: [
        BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Accueil())));
                },
                icon: Icon(Icons.home,
                    color: value ? Colors.black : Colors.white)),
            label: ''),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                print('$value');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Save(Onpage: value))));
              },
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
  const SaveInput({Key? key}) : super(key: key);

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
            onPressed: () {},
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
