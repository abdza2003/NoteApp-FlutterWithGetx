import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/Theme/Themes.dart';
import 'package:sampleproject/main.dart';

class ThemeController extends GetxController {
  ThemeMode get themeApp {
    return _getTheme() == false ? ThemeMode.light : ThemeMode.dark;
  }

  _saveTheme(bool isDarKTheme) {
    return pref.setBool('ThemeApp', isDarKTheme);
  }

  _getTheme() {
    return pref.getBool('ThemeApp') ?? false;
  }

  ChangeTheme() {
    if (_getTheme() == false) {
      Get.changeThemeMode(ThemeMode.dark);
      _saveTheme(!_getTheme());
    } else {
      Get.changeThemeMode(ThemeMode.light);
      _saveTheme(!_getTheme());
    }
  }
}
