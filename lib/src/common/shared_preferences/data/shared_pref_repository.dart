import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'shared_pref_repository.g.dart';

abstract class SharedPrefRepositortInterface {
  Future<dynamic> read(String key);
  Future<void> save(String key, dynamic value);
  Future<dynamic> remove(String key);
}

class SharedPrefRepository implements SharedPrefRepositortInterface {
  @override
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  @override
  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  Future<bool?> readBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  saveBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }
}

@Riverpod(keepAlive: true)
SharedPrefRepositortInterface sharedPrefRepository(
    SharedPrefRepositoryRef ref) {
  return SharedPrefRepository();
}
