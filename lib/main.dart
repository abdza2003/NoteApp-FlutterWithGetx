import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/Locale/localeController.dart';
import 'package:sampleproject/Locale/myLocale.dart';
import 'package:sampleproject/Theme/ThemeController.dart';
import 'package:sampleproject/Theme/Themes.dart';
import 'package:sampleproject/controller/NoteService.dart';
import 'package:sampleproject/database/DbHelper.dart';
import 'package:sampleproject/screen/homePageScreen.dart';
import 'package:sampleproject/screen/welcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences pref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  await DbHelper().db;
  runApp(todo());
}

class todo extends StatefulWidget {
  @override
  State<todo> createState() => _todoState();
}

class _todoState extends State<todo> {
  ThemeController s1 = Get.put(ThemeController());
  NoteService s2 = Get.put(NoteService());
  LocaleControllar s3 = Get.put(LocaleControllar());
  @override
  void initState() {
    s2.getNotes();
    print('=========== ${s2.note}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: s3.getLoclae,
      translations: myLocale(),
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: s1.themeApp,
      debugShowCheckedModeBanner: false,
      home: welcomeScreen(),
    );
  }
}
