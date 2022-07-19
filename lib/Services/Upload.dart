import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class Upload {
  // Future<void> import_image() async {
  final picker = ImagePicker();

  // Future<XFile?> pickedFile = picker.pickImage(source: ImageSource.gallery);
  //   final file = File(pickedFile.toString());
  // }

  Future<void> importFile() async {
    final picker = ImagePicker();
    final metadata = SettableMetadata(contentType: "image/jpeg");
    Directory appDocDir = await getApplicationDocumentsDirectory();
    final filePath = "${appDocDir.absolute}/path/to/mountains.jpg";

    // Future<XFile?> pickedFile = picker.pickImage(source: ImageSource.gallery);
    Future<XFile?> pickedFile = picker.pickImage(source: ImageSource.gallery);
    //final mountainsRef = storageRef.child("mountains.jpg");
    //final mountainsImagesRef = storageRef.child("images/$imageName");
    final file = await File(pickedFile.toString());
    final storageRef = FirebaseStorage.instance.ref();
    final imageName = '${DateTime.now().microsecondsSinceEpoch}.jpg';
    final uploadTask = storageRef
        .child("images/path/to/mountains.jpg")
        .putFile(file, metadata);
    final file_URL = await (await uploadTask).ref.getDownloadURL();
    final save = await FirebaseFirestore.instance
        .collection("images")
        .doc("id")
        .update({'uploadedImage': file_URL});

    uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
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
}
