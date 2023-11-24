import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

StateProvider<bool> loadingProvider = StateProvider((ref) => false);
StateProvider<bool> userActiveProvider = StateProvider((ref) => false);
StateProvider<UserCredential?> usercrendentialProvider =
    StateProvider((ref) => null);
