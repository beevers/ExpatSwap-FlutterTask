import 'package:flutter_riverpod/flutter_riverpod.dart';

StateProvider<bool> loadingProvider = StateProvider((ref) => false);
StateProvider<bool> userActiveProvider = StateProvider((ref) => false);
