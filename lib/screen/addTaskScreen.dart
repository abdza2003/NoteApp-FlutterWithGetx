import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sampleproject/Theme/ThemeController.dart';
import 'package:sampleproject/Theme/Themes.dart';
import 'package:sampleproject/controller/NoteService.dart';
import 'package:sampleproject/controller/Notes.dart';
import 'package:sampleproject/screen/homePageScreen.dart';
import 'package:sampleproject/widget/inputFaild.dart';
import 'package:sampleproject/widget/myButton.dart';

class addTaskScreen extends StatefulWidget {
  @override
  State<addTaskScreen> createState() => _addTaskScreenState();
}

class _addTaskScreenState extends State<addTaskScreen> {
  ThemeController s1 = Get.find();
  NoteService s2 = Get.find();

  TextEditingController _TextTitle = new TextEditingController();
  TextEditingController _TextNote = new TextEditingController();
  ////
  late DateTime savedDateTime;
  late String getSavedDateTime;
  ////
  late int selectedColor;
  late List<int> ListColor;
  ////
  late DateTime _dateTime;
  late String selectedDate;

  ///
  late TimeOfDay _dateTimeOclok;
  late DateTime timePicketDateTime;
  var newTime;

  ///
  late int selectedRemind;
  late List<int> ListRemind;
  //
  late String selectedRepeat;
  late List<String> ListRepeat;
  bool isReminder = false;
///////////
  showDate() async {
    var result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        _dateTime = value as DateTime;
        selectedDate = DateFormat.yMd().format(_dateTime);
      });
    }).catchError((val) {
      print('--not val--');
    });
  }

  showTime() async {
    var result = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _dateTimeOclok = value as TimeOfDay;
        timePicketDateTime = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          _dateTimeOclok.hour,
          _dateTimeOclok.minute,
        );

        newTime = formatDate(timePicketDateTime, [hh, ':', nn, ' ', am]);
      });
    }).catchError((val) {
      print('--not val--');
    });
  }

  @override
  void initState() {
    s2.getNotes();
    savedDateTime = DateTime.now();
    getSavedDateTime =
        formatDate(savedDateTime, [mm, '/', dd, ' ', hh, ':', nn, ' ', am]);
    newTime =
        '${DateTime.now().hour.toString().padLeft(2, '0')}:${DateTime.now().minute.toString().padLeft(2, '0')}';
    _dateTimeOclok = TimeOfDay.now();
    timePicketDateTime = DateTime.now();
    ListRepeat = ['20'.tr, '21'.tr, '22'.tr];
    selectedRepeat = '20'.tr;
    selectedRemind = 5;
    ListRemind = [5, 10, 15, 20];
    ListColor = [0, 1, 2];
    selectedColor = 0;
    _dateTime = DateTime.now();
    selectedDate = DateFormat.yMd().format(_dateTime);

    super.initState();
  }

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
            '2'.tr,
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${DateFormat.yMMMEd().format(DateTime.now())}',
                  style: Themes().headLine3.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                inputFaild(
                  maxLength: 50,
                  title: '5'.tr,
                  hintText: '10'.tr,
                  textEditingController: _TextTitle,
                  maxLines: 1,
                ),
                inputFaild(
                  maxLines: 3,
                  maxLength: 200,
                  title: '6'.tr,
                  hintText: '11'.tr,
                  textEditingController: _TextNote,
                ),
                ////////////
                //////
                ////////////////////
                ///
                AnimatedContainer(
                  height:
                      isReminder ? MediaQuery.of(context).size.height / (6) : 0,
                  duration: Duration(milliseconds: 400),
                  child: inputFaild(
                    title: '12'.tr,
                    hintText: '${selectedDate}',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_month_outlined),
                      onPressed: () {
                        showDate();
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: AnimatedContainer(
                          height: isReminder
                              ? MediaQuery.of(context).size.height / (6)
                              : 0,
                          duration: Duration(milliseconds: 400),
                          child: inputFaild(
                              title: '13'.tr,
                              hintText: '${newTime}',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.timelapse_sharp),
                                onPressed: () {
                                  showTime();
                                },
                              ))),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: AnimatedContainer(
                        height: isReminder
                            ? MediaQuery.of(context).size.height / (6)
                            : 0,
                        duration: Duration(milliseconds: 400),
                        child: inputFaild(
                            title: '14'.tr,
                            hintText: '${selectedRemind}m ' + '23'.tr,
                            suffixIcon: Container(
                              padding: EdgeInsets.only(right: 15, left: 15),
                              child: DropdownButton(
                                items: ListRemind.map(
                                  (val) => DropdownMenuItem(
                                    child: Text('${val}'),
                                    value: val,
                                  ),
                                ).toList(),
                                onChanged: (val) {
                                  setState(() {
                                    selectedRemind = val as int;
                                  });
                                },
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                AnimatedContainer(
                  height: isReminder
                      ? MediaQuery.of(context).size.height / (5.8)
                      : 0,
                  duration: Duration(milliseconds: 400),
                  child: inputFaild(
                      title: '15'.tr,
                      hintText: '${selectedRepeat}',
                      suffixIcon: Container(
                        padding: EdgeInsets.only(right: 15, left: 15),
                        child: DropdownButton(
                          items: ListRepeat.map(
                            (val) => DropdownMenuItem(
                              child: Text('${val}'),
                              value: val,
                            ),
                          ).toList(),
                          onChanged: (String? val) {
                            setState(() {
                              selectedRepeat = val as String;
                            });
                          },
                        ),
                      )),
                ),
                ////////////////
                ///////////
                ////////////
                Transform.translate(
                  offset: Offset(0, -(MediaQuery.of(context).size.height / 78)),
                  child: Row(
                    children: [
                      Text(
                        '7'.tr,
                        style: TextStyle(
                          color: ThemeController().themeApp == ThemeMode.light
                              ? Colors.black
                              : Colors.white,
                          fontSize: MediaQuery.of(context).size.width / (19.6),
                        ),
                      ),
                      Checkbox(
                        value: isReminder,
                        onChanged: (val) {
                          setState(() {
                            isReminder = val as bool;
                          });
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '8'.tr,
                          style: Themes().headLine3,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: List.generate(
                            ListColor.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(2.4),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColor = index;
                                  });
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: index == 0
                                          ? Colors.red
                                          : index == 1
                                              ? Colors.orange
                                              : Colors.indigo,
                                      radius:
                                          MediaQuery.of(context).size.height /
                                              (39.5),
                                    ),
                                    index == selectedColor
                                        ? Icon(Icons.done)
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    MyButton(func: submit, title: '9'.tr)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }

  submit() async {
    if (_TextNote.text.isEmpty && _TextTitle.text.isEmpty) {
      getSnackBar('17'.tr);
    } else if (_TextNote.text.isEmpty) {
      getSnackBar('19'.tr);
    } else if (_TextTitle.text.isEmpty) {
      getSnackBar('19'.tr);
    } else {
      var value = await s2.addNotes(
          notes: Notes(
        title: _TextTitle.text,
        note: _TextNote.text,
        date: selectedDate,
        time: newTime,
        savedDateTime: getSavedDateTime,
        rimind: selectedRemind,
        repeat: selectedRepeat,
        color: selectedColor,
      ));
      Get.off(() => homePageScreen());
      print('added ==== $value');
    }
  }

  getSnackBar(String title) {
    Get.snackbar(
      '16'.tr,
      '$title',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.cyan[800],
      colorText: Colors.white,
      icon: Icon(Icons.error),
      margin: EdgeInsets.all(15),
    );
  }
}
