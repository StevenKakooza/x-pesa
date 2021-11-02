import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProvider extends ChangeNotifier {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;
  String dbName = 'usfp.db';
  static const String tableName = 'mySavings';
  static const String colSavingId = 'savingId';
  static const String colAmmount = 'colSavingId';
  static const String colSavingStatus = 'savingStatus';

  initDataBase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, dbName);
    return await openDatabase(dbPath, version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, version) async {
    await db.execute('''
    CREATE TABLE $tableName(
      $colSavingId INTEGER PRIMARY KEY AUTOINCREMENT,
      $colAmmount,
      $colSavingStatus
    )
    ''');
    print('db started!');
  }

  Future<Database> get database async {
    if (_database != null) {
      print('db Exists');
      return _database;
    } else {
      print('no db found, Creating one..');

      _database = await initDataBase();
      return _database;
    }
  }
}
