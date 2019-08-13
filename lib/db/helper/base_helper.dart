import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../db_manager.dart';

///
/// Create by Hugo.Guo
/// Date: 2019-07-15
///
abstract class BaseHelper {
  Future<Database> getDataBase() async {
    return await DBManager.getCurrentDatabase();
  }
}
