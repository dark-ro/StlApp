import 'package:flutter/material.dart';
import 'package:styliste/Screens/List.dart';
import 'package:styliste/Screens/Save.dart';
import 'package:styliste/Screens/accueil.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(backgroundColor: Colors.amber, items: [
      BottomNavigationBarItem(
          icon: IconButton(
              onPressed: !value
                  ? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Accueil(
                                    Onpage: value,
                                  ))));
                    }
                  : () => print('Vous êtes déjà sur la page demandé'),
              icon:
                  Icon(Icons.home, color: value ? Colors.black : Colors.white)),
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
            onPressed: !value
                ? () {
                    setState(() {
                      value = !value;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => ClientList(
                              Onpage: value,
                            )),
                      ),
                    );
                  }
                : () => print('Vous êtes déjà sur la page demandé'),
            icon: Icon(Icons.list, color: value ? Colors.white : Colors.black),
          ),
          label: ''),
    ]);
  }
}
