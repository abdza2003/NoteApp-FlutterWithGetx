import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sampleproject/Locale/localeController.dart';
import 'package:sampleproject/Theme/ThemeController.dart';
import 'package:sampleproject/Theme/Themes.dart';
import 'package:sampleproject/controller/NoteService.dart';
import 'package:sampleproject/screen/descriptionScreen.dart';
import 'package:sampleproject/widget/bottoSheatItem.dart';

class showGridView extends StatefulWidget {
  @override
  State<showGridView> createState() => _showGridViewState();
}

class _showGridViewState extends State<showGridView> {
  ThemeController s1 = Get.find();
  NoteService s2 = Get.find();
  LocaleControllar s3 = Get.find();

  @override
  void initState() {
    s2.getNotes();
    print('---------- ${s2.note[0]}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await s2.getNotes();
      },
      child: GridView(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: MediaQuery.of(context).size.height / (3.32),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        shrinkWrap: true,
        children: List.generate(s2.note.length, (index) {
          var itemcount = (s2.note.length - 1) - index;
          var getInf = s2.note[itemcount];
          return GestureDetector(
            onTap: () {
              Get.bottomSheet(
                Container(
                  height: MediaQuery.of(context).size.height / (3.2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeController().themeApp == ThemeMode.dark
                        ? Color.fromARGB(207, 53, 52, 52)
                        : Color.fromARGB(207, 255, 255, 255),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        bottomSheetItem(
                          func: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                duration: Duration(milliseconds: 300),
                                child: descriptionScreen(
                                        inf:
                                            '${getInf.savedDateTime} |${getInf.title} |${getInf.note}')
                                    as Widget,
                                type: PageTransitionType.bottomToTop,
                              ),
                            );
                          },
                          title: '24'.tr,
                        ),
                        bottomSheetItem(
                          func: () {
                            Get.back();
                            s2.deleteItem(getInf);
                            s2.getNotes();
                          },
                          title: '25'.tr,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          // height: 50,
                          width: 200,
                          child: Divider(
                            color: ThemeController().themeApp == ThemeMode.dark
                                ? Colors.white
                                : Colors.black,
                            thickness: 2,
                          ),
                        ),
                        bottomSheetItem(
                          func: () {
                            Get.back();
                          },
                          title: '26'.tr,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: AnimationConfiguration.staggeredGrid(
              columnCount: 3,
              duration: Duration(milliseconds: 1000),
              position: index,
              child: ScaleAnimation(
                duration: Duration(milliseconds: 1000),
                child: FadeInAnimation(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: getInf.color == 0
                            ? Colors.redAccent
                            : getInf.color == 1
                                ? Colors.orange
                                : Colors.indigo,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${getInf.title}",
                              style: Themes().headLine1.copyWith(fontSize: 22),
                            ),
                            SizedBox(
                              height: 2.5,
                            ),
                            Text(
                              "${getInf.savedDateTime}",
                              style: Themes().headLine1.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            SizedBox(
                              width: 120,
                              child: Divider(
                                color: Colors.white,
                                thickness: 1.2,
                              ),
                            ),
                            Container(
                              margin: s3.getLoclae == Locale('en')
                                  ? EdgeInsets.only(
                                      right: 15,
                                    )
                                  : EdgeInsets.only(left: 15),
                              child: Text(
                                getInf.note.toString().length < 60
                                    ? "${getInf.note.toString()}"
                                    : '${getInf.note.toString().substring(0, 60)} .... ',
                                style:
                                    Themes().headLine1.copyWith(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
