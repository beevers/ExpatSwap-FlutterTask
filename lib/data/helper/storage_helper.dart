import 'package:hive_flutter/hive_flutter.dart';

class StorageHelper {
  static final appLocalStorage = Hive.box('app-local-storage');
  static Future setBool(String key, bool value) async {
    await appLocalStorage.put(key, value);
  }

  static bool? getBool(String key) {
    return appLocalStorage.get(key);
  }
}
