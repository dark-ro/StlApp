// ignore_for_file: file_names

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_search/firestore_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:styliste/Screens/Save.dart';
import 'accueil.dart';

class ClientList extends StatefulWidget {
  final bool Onpage;
  const ClientList({Key? key, required this.Onpage}) : super(key: key);

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  bool value = true;
  bool tout = false;
  bool Onlist = true;
  String _recherche = '';
  String afficher = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                onChanged: (value) => {_recherche = value},
                decoration: InputDecoration(
                    icon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        // ignore: avoid_print, unnecessary_string_interpolations
                        print('$_recherche');
                      },
                    ),
                    alignLabelWithHint: true,
                    hintText: 'Rechercher un client',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            // FirestoreSearchResults.builder(tag: 'tag', firestoreCollectionName: 'users', searchBy: 'Nom', dataListFromSnapshot: document as List,),
            // IconButton(onPressed: () {}, icon: Icon(Icons.search))

            //IconButton(onPressed: () {}, icon: Icon(Icons.sort_by_alpha)),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          tout = true;
                        });
                      },
                      child: const Text(
                        'Tout',
                        style: TextStyle(color: Colors.black),
                      )),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        tout = false;
                      });
                    },
                    child: const Text('Favoris',
                        style: TextStyle(color: Colors.black)),
                  )
                ],
              ),
            ),
            Personlist(
              Tout: tout,
            ),
          ],
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
              onPressed: !Onlist
                  ? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ClientList(
                                    Onpage: value,
                                  ))));
                    }
                  : () => print('object'),
              icon:
                  Icon(Icons.list, color: value ? Colors.white : Colors.black),
            ),
            label: ''),
      ]),
    );
  }
}

class Personlist extends StatefulWidget {
  bool Tout;
  Personlist({Key? key, required this.Tout}) : super(key: key);

  // ignore: non_constant_identifier_names
  final List PersonList = const [
    {'name': 'Adèle', 'like': false},
    {'name': 'Saliba', 'like': true},
    {'name': 'Sandrine', 'like': false},
    {'name': 'Rachel', 'like': true},
    {'name': 'Cécile', 'like': true},
    {'name': 'Harmonie', 'like': false},
    {'name': 'Rosy', 'like': true},
    {'name': 'Naomie', 'like': false},
  ];

  @override
  State<Personlist> createState() => _PersonlistState();
}

class _PersonlistState extends State<Personlist> {
  Stream<QuerySnapshot> listen =
      FirebaseFirestore.instance.collection('users').snapshots();
  String Like = "Like";
  bool etat = true;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: listen,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return widget.Tout
              ? Container(
                  height: 430,
                  //margin: EdgeInsets.only(bottom: 100),
                  //color: Colors.blueGrey,
                  //padding: EdgeInsets.only(top: 20),
                  child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: snapshot.data!.docs.map((e) {
                        Map<String, dynamic> data =
                            e.data() as Map<String, dynamic>;
                        return Container(
                          height: 80,
                          decoration: const BoxDecoration(
                            //color: Colors.amber,
                            border: Border.symmetric(
                                horizontal: BorderSide(
                                    width: 0.5,
                                    style: BorderStyle.solid,
                                    color: Colors.grey)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data['Nom'],
                                style: const TextStyle(fontSize: 25),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    etat = !etat;
                                    FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(e.id)
                                        .update({"Like": etat}).then((value) =>
                                            print("Update sucessfuly"));
                                  });
                                },
                                icon: FaIcon(FontAwesomeIcons.solidHeart,
                                    color: data['Like']
                                        ? Colors.amber
                                        : Colors.black12),
                              ),
                              // IconButton(
                              //     onPressed: () {},
                              //     icon: Icon(
                              //       Icons.navigate_next,
                              //     )),
                            ],
                          ),
                        );
                      }).toList()),
                )
              : ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: snapshot.data!.docs.map((e) {
                    Map<String, dynamic> data =
                        e.data() as Map<String, dynamic>;
                    if (data['Like'] == true) {
                      return Container(
                        height: 80,
                        decoration: const BoxDecoration(
                          //color: Colors.amber,
                          border: Border.symmetric(
                              horizontal: BorderSide(
                                  width: 0.5,
                                  style: BorderStyle.solid,
                                  color: Colors.grey)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data['Nom'],
                              style: const TextStyle(fontSize: 25),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  etat = !etat;
                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(e.id)
                                      .update({"Like": etat}).then((value) =>
                                          print("Update sucessfuly"));
                                });
                              },
                              icon: FaIcon(FontAwesomeIcons.solidHeart,
                                  color: data['Like']
                                      ? Colors.amber
                                      : Colors.black12),
                            ),
                            // IconButton(
                            //     onPressed: () {},
                            //     icon: Icon(
                            //       Icons.navigate_next,
                            //     )),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }).toList(),
                );
//   }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
