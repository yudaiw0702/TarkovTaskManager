import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'my_table';

  //命名規約に沿って名前つける(https://qiita.com/genzouw/items/35022fa96c120e67c637)
  static final columnId = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';

  // DatabaseHelperクラスをシングルトンにするためのコンストラクタ
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // DBにアクセスするためのメソッド
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // データベースを開く。データベースがない場合は作る関数
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // DBを作成するメソッド
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnAge INTEGER NOT NULL
          )
          ''');
  }

  // Helper methods

  // 挿入
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // 全件取得
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database; //DBにアクセスする
    return await db.query(table); //全件取得
  }

  // データ件数取得
  Future<int> queryRowCount() async {
    Database db = await instance.database; //DBにアクセスする
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // 更新
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database; //DBにアクセスする
    int id = row[columnId]; //引数のマップ型のcolumnIDを取得
    print([id]);
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // 削除
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
