import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expatswap_fluttertask/data/global_var/global_variable.dart';
import 'package:expatswap_fluttertask/model/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CloudFirestoreViewModel {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<void> saveData(
      {required String name,
      required String email,
      required String phone,
      required String dob,
      required String address}) {
    return users
        .add({
          'name': name,
          'email': email,
          'phone': phone,
          'dob': dob,
          'address': address
        })
        .then((value) => print("Data Added"))
        .catchError((error) => print("Failed to add data: $error"));
  }

  Stream<List<Map<String, dynamic>>> readUser() =>
      users.snapshots().map((snapshot) => snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return {
              'id': doc.id,
              'data': UserModel.fromJson(data),
            };
          }).toList());

  Future<bool> deleteData(String docId) async {
    try {
      await users.doc(docId).delete();
      return true;
    } catch (error) {
      debugPrint('Error deleting document: $error');
      return false;
    }
  }
}
