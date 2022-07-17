import 'package:sampleproject/main.dart';

class ShowStyle {
  int get getshowStyle {
    return pref.getBool('showStyle') == true ? 1 : 0;
  }

  saveStyle(bool showStyle) {
    return pref.setBool('showStyle', showStyle);
  }

  getStyle() {
    return pref.getBool('showStyle') ?? false;
  }

  void changeStyle() {
    if (getStyle() == false) {
      saveStyle(!getStyle());
    } else {
      saveStyle(!getStyle());
    }
  }
}
