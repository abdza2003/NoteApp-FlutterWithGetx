import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampleproject/Locale/localeController.dart';

class MyButton extends StatelessWidget {
  LocaleControllar s3 = Get.find();

  var func;
  String title;
  MyButton({
    required this.func,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        alignment: Alignment.center,
        elevation: MaterialStateProperty.all(5),
        backgroundColor: MaterialStateProperty.all(
          Colors.cyan[700],
        ),
      ),
      onPressed: () {
        func();
      },
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          '${title}',
          style: TextStyle(
            fontSize: s3.getLoclae == Locale('en')
                ? MediaQuery.of(context).size.width / (22.6)
                : MediaQuery.of(context).size.width / (23.6),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
