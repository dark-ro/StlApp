// ignore_for_file: file_names
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
  String _recherche = '';
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
                onChanged: (value) => _recherche = value,
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
            // IconButton(onPressed: () {}, icon: Icon(Icons.search))

            //IconButton(onPressed: () {}, icon: Icon(Icons.sort_by_alpha)),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Tout',
                        style: TextStyle(color: Colors.black),
                      )),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Favoris',
                        style: TextStyle(color: Colors.black)),
                  )
                ],
              ),
            ),
            const ListSection()
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => ClientList(
                              Onpage: value,
                            ))));
              },
              icon:
                  Icon(Icons.list, color: value ? Colors.white : Colors.black),
            ),
            label: ''),
      ]),
    );
  }
}

class ListSection extends StatelessWidget {
  const ListSection({Key? key}) : super(key: key);
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
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 430,
      //margin: EdgeInsets.only(bottom: 100),
      //color: Colors.blueGrey,
      //padding: EdgeInsets.only(top: 20),
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: PersonList.map((e) {
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
                    e['name'],
                    style: const TextStyle(fontSize: 25),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.solidHeart,
                        color: e['like'] ? Colors.amber : Colors.black12),
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
    );
  }
}
