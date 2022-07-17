import 'package:path/path.dart';
import 'package:sampleproject/controller/Notes.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  String tableName = 'tasks';
  Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialData();
      return _db;
    } else {
      return _db;
    }
  }

  initialData() async {
    var databasePath = await getDatabasesPath();
    String path = await join(databasePath, 'tasks.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 6, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print('================= NEW VERISON CREATED');
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
   CREATE TABLE "$tableName" (
      'id' INTEGER PRIMARY KEY AUTOINCREMENT,
      'title' STRING,
      'note' TEXT,
      'date' STRING,
      'time' STRING,
      'savedDateTime' STRING,
      'repeat' STRING,
      'rimind' INTEGET,
      'color' INTEGET
      )
    ''');
    print('================= SQL CREATED');
  }

  read() async {
    Database? mydb = await db;
    var res = await mydb!.query('$tableName');
    return res;
  }

  insert(Notes notes) async {
    Database? mydb = await db;
    var res = await mydb!.insert('$tableName', notes.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  delete(Notes notes) async {
    Database? mydb = await db;
    var res = await mydb!.delete(
      '$tableName',
      where: 'id = ?',
      whereArgs: [notes.id],
    );
    return res;
  }
}
