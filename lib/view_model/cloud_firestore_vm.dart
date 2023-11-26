import 'package:expatswap_fluttertask/data/provider/cloud_firestore_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model/user_model.dart';

class CloudFirestoreViewModel {
  Future<bool> saveData(WidgetRef ref,
      {required String name,
      required String email,
      required String phone,
      required String dob,
      required String address}) async {
    await ref.read(cloudFirestoreService).saveData(
        name: name, email: email, phone: phone, dob: dob, address: address);
    return true;
  }

  Future<bool> deleteData(WidgetRef ref, String docId) async {
    final response = await ref.read(cloudFirestoreService).deleteData(docId);
    return response ? true : false;
  }

  Future<bool> updateData(WidgetRef ref,
      {required String docId, required UserModel user}) async {
    final response = await ref
        .read(cloudFirestoreService)
        .updateData(docId: docId, user: user);
    return response ? true : false;
  }

  Stream<List<Map<String, dynamic>>> readUser(WidgetRef ref) {
    Stream<List<Map<String, dynamic>>> userStream =
        ref.read(cloudFirestoreService).readUser();
    return userStream;
  }
}
