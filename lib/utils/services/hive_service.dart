import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveService {
  static late Box box;

  static Future<void> init() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    box = await Hive.openBox('venturo');
  }

  static Future<void> save(String key, dynamic value) async {
    await box.put(key, value);
  }

  static dynamic get(String key) {
    return box.get(key);
  }

  static Future<void> delete(String key) async {
    await box.delete(key);
  }

  static Future<void> clear() async {
    await box.clear();
  }
}
