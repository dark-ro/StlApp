// ignore_for_file: avoid_print
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:styliste/Screens/Details.dart';
import 'package:styliste/Screens/Home.dart';
import 'package:styliste/Screens/List.dart';
import 'package:styliste/Screens/Save.dart';
import 'package:flutter/services.dart';
import 'package:styliste/Services/Services.dart';
import 'package:styliste/Services/Upload.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Accueil extends StatefulWidget {
  Accueil({
    Key? key,
  }) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  UserService _userService = UserService();
  Upload _upload = Upload();
  bool value = true;
  String filepath = '';

  Future selectFile() async {
    ImagePicker picker = ImagePicker();
    List<XFile> imageList = [];
    final List<XFile>? imageSelected = await picker.pickMultiImage();
    if (imageList.isEmpty) {
      imageList.addAll(imageSelected!);
    }
    setState(() {
      filepath = (imageSelected!.first.path);
    });
    print(filepath);
    // final picker = ImagePicker();
    // final result = picker.pickImage(source: ImageSource.gallery);
  }

  Future importFile() async {
    final firebaseStorage = FirebaseStorage.instance.ref();
    final metadata = SettableMetadata(contentType: "image/jpeg");
    final imageName = '${DateTime.now().microsecondsSinceEpoch}.jpg';
    final file = await File(filepath).absolute;
    final uploadtask = firebaseStorage
        .child('images/${imageName}.jpg')
        .putFile(file, metadata);
    final file_URL = await (await uploadtask).ref.getDownloadURL();
    final save = await FirebaseFirestore.instance
        .collection('images')
        .doc('images')
        .set({'imageUploaded': file_URL}, SetOptions(merge: true));

    uploadtask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress =
              100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          print("Upload is $progress% complete.");
          break;
        case TaskState.paused:
          print("Upload is paused.");
          break;
        case TaskState.canceled:
          print("Upload was canceled");
          break;
        case TaskState.error:
          // Handle unsuccessful uploads
          break;
        case TaskState.success:
          // Handle successful uploads on complete
          // ...
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: (() {
              _userService.logout();
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => Home())));
            }),
            icon: FaIcon(FontAwesomeIcons.powerOff)),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
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
          children: [
            Text(
              'Nouveautés',
              style: TextStyle(fontSize: 30),
            ),
            IconButton(
                onPressed: () {
                  selectFile();
                },
                icon: Icon(Icons.add_a_photo)),
            IconButton(
                onPressed: () {
                  importFile();
                },
                icon: Icon(Icons.download)),
            News(),
            Text(
              'Dernier ajout',
              style: TextStyle(fontSize: 30),
            ),
            PersonAdd(),
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

class PersonAdd extends StatefulWidget {
  PersonAdd({Key? key}) : super(key: key);

  @override
  State<PersonAdd> createState() => _PersonAddState();
}

class _PersonAddState extends State<PersonAdd> {
  final Stream<QuerySnapshot> listen =
      FirebaseFirestore.instance.collection('users').snapshots();
  String Nom = '';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: listen,
      builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          print('Yes data is actually here');
          return Column(
            children: snapshot.data!.docs.map(
              (DocumentSnapshot e) {
                Map<String, dynamic> data = e.data()! as Map<String, dynamic>;
                Nom = data['Nom'];
                return Container(
                  margin: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 1,
                          blurRadius: 15),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // TextButton(onPressed: getName, child: Text('Dernier Ajout')),
                        Text(
                          data['Nom'],
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 100,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => Details(
                                                data: {
                                                  'Nom': data['Nom'],
                                                  'Taille': data['Taille'],
                                                  'Longueur': data['Longueur'],
                                                  'Poitrine': data['Poitrine'],
                                                  'Jambe': data['Jambe'],
                                                  'Bras': data['Bras'],
                                                  'Cuisse': data['Cuisse'],
                                                  'Dos': data['Dos']
                                                },
                                              ))));
                                },
                                icon: Icon(Icons.arrow_forward_ios))
                          ],
                        ),
                        // ignore: avoid_print
                      ],
                    ),
                  ),
                );

                //  Container(
                //             margin: const EdgeInsets.symmetric(vertical: 10),
                //             height: 300,
                //             width: MediaQuery.of(context).size.width,
                //             color: Colors.amber,
                //             child: Text(e.toString()),
                //           );
              },
            ).toList(),
          );
        }
        if (snapshot.hasError) {
          print('we have error');
          print(snapshot.error);
        }

        return Container(
          child: Text('data'),
        );
        // Container(
        //     margin: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        //     height: 130,
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(20),
        //       boxShadow: const [
        //         BoxShadow(
        //             color: Colors.black38, spreadRadius: 1, blurRadius: 15),
        //       ],
        //     ),
        //     child: Container(
        //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           // TextButton(onPressed: getName, child: Text('Dernier Ajout')),
        //           Text(
        //             name,
        //             style: TextStyle(color: Colors.black, fontSize: 30),
        //           ),
        //           Row(
        //             children: [
        //               IconButton(
        //                 onPressed: () {
        //                   print(name);
        //                 },
        //                 icon: Icon(
        //                   Icons.person,
        //                   size: 100,
        //                 ),
        //               ),
        //             ],
        //           ),
        //           // ignore: avoid_print
        //         ],
        //       ),
        //     ),
        //   );
        // }
        // return Container(
        //   child: Text('Coucou'),
        // );
      }),
    );
  }
}

// String nameGet = '';
// Future getName() async {
//   String name = 'sdf';

//   final docRef = await FirebaseFirestore.instance
//       .collection('users')
//       .get()
//       .then((value) => {
//             for (var doc in value.docs)
//               {
//                 print("${doc.id} => ${doc.data().values.elementAt(5)}"),
//                 name = doc.data().values.elementAt(5),
//                 setState(() {
//                   nameGet = name;
//                 }),
//               }
//           });
// }

// final docRef = FirebaseFirestore.instance.collection('users').doc();

// Container(
//   margin: const EdgeInsets.fromLTRB(15, 20, 15, 20),
//   height: 130,
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(20),
//     boxShadow: const [
//       BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 15),
//     ],
//   ),
//   child: Container(
//     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         // TextButton(onPressed: getName, child: Text('Dernier Ajout')),
//         Text(
//           nameGet,
//           style: TextStyle(color: Colors.black, fontSize: 30),
//         ),
//         Row(
//           children: [
//             IconButton(
//               onPressed: () {
//                 getName();
//                 print(nameGet);
//               },
//               icon: Icon(
//                 Icons.person,
//                 size: 100,
//               ),
//             ),
//           ],
//         ),
//         // ignore: avoid_print
//       ],
//     ),
//   ),
// );

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
