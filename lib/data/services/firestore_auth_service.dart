import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expatswap_fluttertask/model/user_model/user_model.dart';
import 'package:flutter/material.dart';

// Service class responsible for interacting with Cloud Firestore
class CloudFirestoreService {
  // Reference to the 'users' collection in Cloud Firestore
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  // Method to save user data to Cloud Firestore
  Future<void> saveData({
    required String name,
    required String email,
    required String phone,
    required String dob,
    required String address,
  }) {
    // Add user data to the 'users' collection
    return users
        .add({
          'name': name,
          'email': email,
          'phone': phone,
          'dob': dob,
          'address': address,
        })
        // Handle success by printing a debug message
        .then((value) => debugPrint("Data Added"))
        // Handle errors by printing an error message
        .catchError((error) => debugPrint("Failed to add data: $error"));
  }

  // Method to read user data from Cloud Firestore as a stream of Maps
  Stream<List<Map<String, dynamic>>> readUser() => users.snapshots().map(
        (snapshot) => snapshot.docs.map(
          (doc) {
            // Extract user data from the document and map it to a Map
            final data = doc.data() as Map<String, dynamic>;
            return {
              'id': doc.id,
              'data': UserModel.fromJson(data),
            };
          },
        ).toList(),
      );

  // Method to delete user data from Cloud Firestore
  Future<bool> deleteData(String docId) async {
    try {
      // Delete the document with the specified document ID
      await users.doc(docId).delete();
      // Return true to indicate successful deletion
      return true;
    } catch (error) {
      // Handle errors by printing an error message and return false
      debugPrint('Error deleting document: $error');
      return false;
    }
  }

  // Method to update user data in Cloud Firestore
  Future<bool> updateData({
    required String docId,
    required UserModel user,
  }) async {
    try {
      // Update the document with the specified document ID
      await users.doc(docId).update({
        'name': user.name,
        'phone': user.phone,
        'address': user.address,
        'email': user.email,
        'dob': user.dob,
      });
      // Return true to indicate successful update
      return true;
    } catch (error) {
      // Handle errors by printing an error message and return false
      debugPrint('Error updating document: $error');
      return false;
    }
  }
}
