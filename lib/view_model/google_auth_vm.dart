import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../data/global_var/global_variable.dart';
import '../data/helper/storage_helper.dart';

class GoogleAuthViewModel extends ChangeNotifier {
  Future<UserCredential?> signInWithGoogle(WidgetRef ref) async {
    try {
      ref.read(loadingProvider.notifier).state = true;
      //Trigger authentication flow
      final GoogleSignInAccount? user = await GoogleSignIn().signIn();
      user == null
          ? StorageHelper.setBool('activeUser', false)
          : StorageHelper.setBool('activeUser', true);

      ref.read(loadingProvider.notifier).state = false;
      //Obtain auth details
      final GoogleSignInAuthentication? googleAuth = await user?.authentication;
      //create new credential
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      final logDetails =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return logDetails;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }

    return null;
  }
}
