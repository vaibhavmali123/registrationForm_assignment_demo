import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


final tableName='users';
class DatabaseProvider
{

  static final DatabaseProvider databaseProvider=DatabaseProvider();

  Database _database;

  Future<Database>get database async{

    if (_database!=null) {
      return _database;
    }
    else{
      _database=await createDatabase();
      return _database;
    }
  }

  createDatabase() async{
    Directory documentsDirectory=await getApplicationDocumentsDirectory();
    String path=join(documentsDirectory.path,
    'myUsers.db');

    var database=await openDatabase(path,version:1,onCreate:initDb,onUpgrade:onUpgrade);

    return database;
  }

  FutureOr<void> onUpgrade(Database db, int oldVersion, int newVersion) {
  if (newVersion>oldVersion) {}
  }

  FutureOr<void> initDb(Database database, int version) async{
    await database.execute("CREATE TABLE $tableName ("
        "id INTEGER PRIMARY KEY, "
        "fName TEXT, "
        "lName TEXT, "
        "mno TEXT, "
        "email TEXT, "
        "gender TEXT, "
        "password TEXT, "
        "eduInfo TEXT, "
        "yearOfPass TEXT, "
        "grade TEXT, "
        "experience TEXT, "
        "designation TEXT, "
        "domain TEXT, "
        "address TEXT, "
        "landmark TEXT, "
        "city TEXT, "
        "state TEXT, "
        "pincode TEXT, "
        "is_done INTEGER "
        ")");
  }


}