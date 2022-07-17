import 'package:flutter/material.dart';
import 'package:sampleproject/Theme/Themes.dart';

class bottomSheetItem extends StatelessWidget {
  Function func;
  String title;
  bottomSheetItem({required this.func, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black,
      onTap: () {
        func();
      },
      child: Container(
        margin: EdgeInsets.only(
          top: (MediaQuery.of(context).size.height / (3.2)) / 16.2,
          // 15
          left: (MediaQuery.of(context).size.height / (3.2)) / 9.7, // 25
          right: (MediaQuery.of(context).size.height / (3.2)) / 9.7, // 25
        ),
        decoration: BoxDecoration(
          color: Colors.cyan[800],
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        height: (MediaQuery.of(context).size.height / (3.2)) / 4.8,
        width: double.infinity,
        child: Text(
          '${title}',
          style: Themes().headLine1.copyWith(
              fontWeight: FontWeight.bold,
              fontSize:
                  ((MediaQuery.of(context).size.height / (3.2)) / 4.8) / 2.8),
        ),
      ),
    );
  }
}
