import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadImage(
      {required String name,
      required String path,
      required String folderName}) async {
    File file = File(path);

    try {
      await storage.ref('$folderName/$name').putFile(file);
      return '$folderName/$name';
    } on FirebaseException catch (e) {
      print("Error occured :::::::::::: $e");
    }
    return 'shops/Snapchat-1757900449';
  }

  Future<ListResult> listFiles({required String folderName}) async {
    ListResult result = await storage.ref(folderName).listAll();

    return result;
  }

  Future<String> downloadURL(
      {required String path}) async {
    String result = await storage.ref(path).getDownloadURL();

    return result;
  }
}
