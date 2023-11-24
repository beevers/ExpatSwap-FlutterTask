import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expatswap_fluttertask/data/global_var/global_variable.dart';
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

  Future<dynamic> retrieveData(WidgetRef ref) async {
    return users.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        ref.read(numberOfDataProvider.notifier).state =
            querySnapshot.docs.length;
        print(querySnapshot.docs.length);
        return doc;
      }
    }).catchError((error) {
      return null;
    });
  }

  Future<void> deleteData() async {
    // Replace 'your_document_id' with the actual ID of the document you want to delete
    String documentIdToDelete = 'your_document_id';

    try {
      await users.doc(documentIdToDelete).delete();
      print('Document successfully deleted');
    } catch (error) {
      print('Error deleting document: $error');
    }
  }
}
