// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Notes {
  int? id;
  String? title;
  String? note;
  String? date;
  String? time;
  String? savedDateTime;
  int? rimind;
  String? repeat;
  int? color;
  Notes({
    this.id,
    this.savedDateTime,
    this.title,
    this.note,
    this.date,
    this.time,
    this.rimind,
    this.repeat,
    this.color,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'note': note,
      'date': date,
      'time': time,
      'savedDateTime': savedDateTime,
      'rimind': rimind,
      'repeat': repeat,
      'color': color,
    };
  }

  Notes.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    note = map['note'];
    date = map['date'];
    time = map['time'];
    savedDateTime = map['savedDateTime'];
    rimind = map['rimind'];
    repeat = map['repeat'];
    color = map['color'];
  }
}
