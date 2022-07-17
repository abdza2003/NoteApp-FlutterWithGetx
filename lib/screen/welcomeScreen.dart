import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sampleproject/Theme/ThemeController.dart';
import 'package:sampleproject/Theme/Themes.dart';
import 'package:sampleproject/screen/homePageScreen.dart';

class welcomeScreen extends StatefulWidget {
  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1000), () {
      Get.off(() => homePageScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: AnimationConfiguration.staggeredGrid(
        columnCount: 0,
        position: 0,
        child: ScaleAnimation(
          duration: Duration(milliseconds: 0),
          child: FadeInAnimation(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.cyan[800],
                    child: SvgPicture.asset(
                      'images/task-6.svg',
                      height: MediaQuery.of(context).size.height / (4.2),
                      width: MediaQuery.of(context).size.width / (4.2),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '28'.tr,
                    style: Themes().headLine3.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
