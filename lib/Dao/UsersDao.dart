import 'dart:async';

import 'package:registrationform_assignment/Models/Users.dart';
import 'package:registrationform_assignment/database/Database.dart';

class UsersDao{

  final dbProvider=DatabaseProvider.databaseProvider;

  Future<int>createUsers(Users users)async{
    final db=await dbProvider.database;
    var result=db.insert(tableName,users.toDatabaseJson());

    return result;
  }

  Future<List<Users>> getUsers({List<String> columns, String query}) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db.query(tableName,
            columns: columns, where: 'name LIKE ?', whereArgs: ["%$query%"]);
    } else {
      result = await db.query(tableName, columns: columns);
    }
    List<Users> subjects = result.isNotEmpty
        ? result.map((item) => Users.fromDatabaseJson(item)).toList()
        : [];
    return subjects;
  }

}