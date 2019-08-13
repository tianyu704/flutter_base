import 'package:sqflite/sqflite.dart';

import 'base_helper.dart';

///
/// Create by Hugo.Guo
/// Date: 2019-07-15
///
class UserHelper extends BaseHelper {
  final String name = "User";
  final String columnId = "id";
  static final UserHelper _instance = new UserHelper._internal();

  factory UserHelper() => _instance;

  UserHelper._internal();

//  /// 创建User，先查有没有，有更新，没有插入
//  Future<bool> createUser(User user) async {
//    if (user == null) {
//      return false;
//    }
//    Database db = await getDataBase();
//    int result;
//    if (await getUser(user.id) == null) {
//      result = await db.insert(name, user.toJson());
//      return result == user.id;
//    }
//    result = await db.update(name, user.toJson(),
//        where: "$columnId = ?", whereArgs: [user.id]);
//    return result == 1;
//  }
//
//  /// 根据id获取user，没有返回null
//  Future getUser(var id) async {
//    Database db = await getDataBase();
//    List<Map> maps =
//        await db.query(name, where: "$columnId = ?", whereArgs: [id]);
//    if (maps.length > 0) {
//      return User.fromJson(maps.first);
//    }
//    return null;
//  }
}
