import 'package:expatswap_fluttertask/data/provider/google_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoogleAuthViewModel extends ChangeNotifier {
  Future<Map<String, dynamic>> signInWithGoogle(WidgetRef ref) async {
    final response =
        await ref.read(googleAuthServiceProvider).signInWithGoogle(ref);
    if (response == null) {
      return {'data': null, 'error': true};
    }
    return {'data': response, 'error': false};
  }
}
