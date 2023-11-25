import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expatswap_fluttertask/model/user_model/user_model.dart';
import 'package:flutter/material.dart';

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
        .then((value) => debugPrint("Data Added"))
        .catchError((error) => debugPrint("Failed to add data: $error"));
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

  Future<bool> updateData(
      {required String docId, required UserModel user}) async {
    try {
      await users.doc(docId).update({
        'name': user.name,
        'phone': user.phone,
        'address': user.address,
        'email': user.email,
        'dob': user.dob
      });
      return true;
    } catch (error) {
      debugPrint('Error deleting document: $error');
      return false;
    }
  }
}
