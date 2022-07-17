import 'package:get/get.dart';
import 'package:sampleproject/controller/Notes.dart';
import 'package:sampleproject/database/DbHelper.dart';
import 'package:sqflite/sqflite.dart';

class NoteService extends GetxController {
  var note = [].obs;

  addNotes({Notes? notes}) async {
    var res = await DbHelper().insert(notes!);
    return res;
  }

  getNotes() async {
    List<Map<String, dynamic>> res = await DbHelper().read();

    note.assignAll(res.map((data) => Notes.fromJson(data)).toList());
  }

  deleteItem(notes) async {
    var res = await DbHelper().delete(notes);
  }
}
