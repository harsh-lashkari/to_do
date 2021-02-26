import 'package:shared_preferences/shared_preferences.dart';

class ChangeTheme {
  bool themeMode;

  Future<void> setInitialAppTheme() async {
    themeMode = await getTheme();
  }

  Future<void> setTheme({bool dark}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    themeMode = dark;
    await prefs.setBool('dark', dark);
  }

  Future<bool> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('dark') ?? false;
  }
}
