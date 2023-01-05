import 'dart:developer';

import '../app.dart';

class SharedPreferencesHelper {
  static SharedPreferences? prefs;

  static String? theme;

//! INITIALIZE PREF
  static void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

//! CLEAR PREFS
  static void clearPrefs() async {
    await prefs?.clear();
  }

//? SAVE NAME
  static void setPrefName({required String name}) {
    prefs?.setString('name', name);
  }

//? GET  NAME
  static String getPrefName() {
    final prefTheme = prefs?.getString('name') ?? '';
    return prefTheme;
  }

//! set true to check for onBoarding
  static void setOnBoardingSeen() {
    prefs?.setBool('seen', true);
  }

  static bool getOnBoardingSeen() {
    bool seenIstTime = prefs?.getBool('seen') ?? false;
    return seenIstTime;
  }
}
