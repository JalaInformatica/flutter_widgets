import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static late Box _box;

  /// Initialize Hive
  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('app');
  }

  /// Save data to Hive
  static Future<void> saveData(String key, dynamic value) async {
    await _box.put(key, value);
  }

  /// Get data from Hive
  static String getStringData(String key) {
    return _box.get(key, defaultValue: "");
  }

  /// Delete data from Hive
  static Future<void> deleteData(String key) async {
    await _box.delete(key);
  }

  /// Clear all stored data
  static Future<void> clearAll() async {
    await _box.clear();
  }
}
