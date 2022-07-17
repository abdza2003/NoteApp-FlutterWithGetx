import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleproject/Theme/ThemeController.dart';
import 'package:sampleproject/Theme/Themes.dart';

class descriptionScreen extends StatefulWidget {
  String inf;
  descriptionScreen({required this.inf});
  @override
  State<descriptionScreen> createState() => _descriptionScreenState();
}

class _descriptionScreenState extends State<descriptionScreen> {
  ThemeController s1 = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            s1.themeApp == ThemeMode.dark ? Icons.sunny : Icons.dark_mode,
          ),
          onPressed: () {
            setState(() {
              s1.ChangeTheme();
            });
          },
        ),
        title: Text(
          '6'.tr,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width / (19.6),
          ),
        ),
      ),
      body: Card(
        margin: EdgeInsets.all(25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          width: 500,
          height: 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.cyan[800],
          ),
          child: Container(
            margin: EdgeInsets.all(30),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        color: Colors.white.withOpacity(.7),
                        size: 40,
                      ),
                      Text(
                        '12'.tr,
                        style: Themes().headLine1.copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.width / (15.6),
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '${widget.inf.toString().split('|')[0]}',
                      style: Themes().headLine2.copyWith(
                            fontSize:
                                MediaQuery.of(context).size.width / (19.6),
                          ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.text_format,
                        color: Colors.white.withOpacity(.7),
                        size: 40,
                      ),
                      Text(
                        '5'.tr,
                        style: Themes().headLine1.copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.width / (15.6),
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '${widget.inf.toString().split('|')[1]}',
                      style: Themes().headLine2.copyWith(
                            fontSize:
                                MediaQuery.of(context).size.width / (16.6),
                          ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.description,
                        color: Colors.white.withOpacity(.7),
                        size: 40,
                      ),
                      Text(
                        '6'.tr,
                        style: Themes().headLine1.copyWith(
                              fontSize:
                                  MediaQuery.of(context).size.width / (15.6),
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SelectableText(
                      '${widget.inf.toString().split('|')[2]}',
                      style: Themes().headLine2.copyWith(
                            fontSize:
                                MediaQuery.of(context).size.width / (21.6),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
