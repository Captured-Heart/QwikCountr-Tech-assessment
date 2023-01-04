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

//? SAVE theme
  static void setPrefTheme({required ThemeMode themeMode}) {
    prefs?.setString('theme', themeMode.name);
  }

  static String getPrefTheme() {
    final prefTheme = prefs?.getString('theme') ?? ThemeMode.system.name;
    return prefTheme;
  }

//? SAVE NAME
  static void setPrefName({required String name}) {
    prefs?.setString('name', name);
  }

  static String getPrefName() {
    final prefTheme = prefs?.getString('name') ?? '';
    return prefTheme;
  }

//! Save Profile profile wallpaper
  static void setProfileWallPaper({required String profWallpaperIndex}) {
    prefs?.setString('profWallpaper', profWallpaperIndex);
    log('wallpaperIndex: $profWallpaperIndex');
  }

  static String getProfileWallPaper() {
    String profWallpaper = prefs?.getString('profWallpaper') ?? '2';
    return profWallpaper;
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
