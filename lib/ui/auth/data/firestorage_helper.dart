import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireStorageHelper {
  FireStorageHelper._();
  static FireStorageHelper fireStorageHelper = FireStorageHelper._();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  Future<String> uploadImage(File file) async {
    String imageName = file.path.split('/').last;
    String fullPath = 'images/$imageName';
    Reference reference = firebaseStorage.ref(fullPath);
    await reference.putFile(file);
    String imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }
}
