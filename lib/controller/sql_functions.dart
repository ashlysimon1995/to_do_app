import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sql.dart';

class sql_register {
  static Future<sql.Database> OpenDb() async {
    return sql.openDatabase('datauser', version: 1,
        onCreate: (sql.Database db, int version) async {
      await createTable(db);
    });
  }

  static Future<void> createTable(sql.Database db) async {
    await db.execute(
        'CREATE TABLE registertb (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, rname TEXT, remail TEXT, rpwd TEXT)');
  }

  static Future<int> newregister(String name, String email, String pwd) async {
    final db = await sql_register.OpenDb();
    final data = {'rname': name, 'remail': email, 'rpwd': pwd};
    final id = await db.insert('registertb', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> readuserdetails() async {
    final db = await sql_register.OpenDb();
    return db.query('registertb', orderBy: 'id');
  }
}
