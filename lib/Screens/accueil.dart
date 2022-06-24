import 'package:flutter/material.dart';
import 'package:styliste/Screens/List.dart';
import 'package:styliste/Screens/Save.dart';

class Accueil extends StatefulWidget {
  Accueil({
    Key? key,
  }) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: const [
          Icon(
            Icons.circle_notifications,
            color: Colors.amber,
            size: 50,
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Text(
              'Nouveautés',
              style: TextStyle(fontSize: 30),
            ),
            News(),
            Text(
              'Dernier ajout',
              style: TextStyle(fontSize: 30),
            ),
            PersonAdd(),
            PersonAdd(),
            PersonAdd()
          ],
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
                    color: value ? Colors.white : Colors.black)),
            label: ''),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Save(Onpage: value))));
              },
              icon: Icon(Icons.person_add_alt_1,
                  color: value ? Colors.black : Colors.white),
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

class PersonAdd extends StatelessWidget {
  const PersonAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 15),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              Icons.person,
              size: 100,
            ),
            Text(
              'Camille',
              style: TextStyle(fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}

class News extends StatelessWidget {
  final List _nouveautes = const [
    {'image': 'images/modèle.jpeg'},
    {'image': 'images/modèle2.jpg'},
    {'image': 'images/modèle3.jpg'},
    {'image': 'images/modèle4.jpg'},
    {'image': 'images/modèle5.jpg'},
    {'image': 'images/modèle6.jpg'},
    {'image': 'images/modèle7.jpg'},
    {'image': 'images/modèle8.jpg'}
  ];
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 15),
        ],
      ),
      child: ListView(
          //scrollDirection: Axis.horizontal,
          children: _nouveautes.map((e) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(e['image']), fit: BoxFit.cover),
          ),
        );
      }).toList()),
    );
  }
}
