import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

///
/// Create by Hugo.Guo
/// Date: 2019-07-15
///
class DBManager {
  static const _dbName = "sleep.db";
  static const _version = 1;
  static Database _database;

  ///初始化
  static init() async {
    // open the database
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _dbName);
    File file = File(path);

    if (!(await file.exists())) {
      file.create(recursive: true);
    }
    _database = await openDatabase(
      path,
      version: _version,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        /// example
//        await db.execute(
//            "CREATE TABLE User (id INTEGER PRIMARY KEY, username TEXT, email TEXT, created_at TEXT, updated_at TEXT, sex INTEGER, language TEXT, city TEXT, country TEXT, headimgurl TEXT, source TEXT)");
//        await db.execute(
//            "CREATE TABLE Audio (aid INTEGER PRIMARY KEY, name TEXT, desc TEXT, img TEXT, like INTEGER, path TEXT, cate TEXT, origin TEXT, create_at TEXT, update_at TEXT)");
      },
    );
  }

  /**
   * 表是否存在
   */
  static isTableExits(String tableName) async {
    await getCurrentDatabase();
    var res = await _database.rawQuery(
        "select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res != null && res.length > 0;
  }

  ///获取当前数据库对象
  static Future<Database> getCurrentDatabase() async {
    if (_database == null) {
      await init();
    }
    return _database;
  }

  ///关闭
  static close() {
    _database?.close();
    _database = null;
  }
}
