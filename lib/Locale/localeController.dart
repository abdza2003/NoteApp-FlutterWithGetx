import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sampleproject/main.dart';

class LocaleControllar extends GetxController {
  var initilLocale = pref.getString('Locale') == null
      ? Locale('en')
      : pref.getString('Locale') == 'en'
          ? Locale('en')
          : Locale('ar');

  void ChamgeLocale(String codeLan) {
    Locale s1 = Locale(codeLan);
    pref.setString('Locale', codeLan);
    initilLocale = Locale('$codeLan');
    Get.updateLocale(s1);
  }

  get getLoclae {
    return initilLocale;
  }
}
