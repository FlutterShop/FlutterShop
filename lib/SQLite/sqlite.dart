import 'package:path/path.dart';
import 'package:shoes_shop/JsonModels/shoes_data.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final databaseName = "shoes.db";

  String shoes = "CREATE TABLE shoes ("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "shoesTitle TEXT, "
      "price TEXT)";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(shoes);
    });
  }

  Future<int> addShoes(ShoesData shoe) async {
    try {
      final Database db = await initDB();
      return await db.insert('shoes', shoe.toMap());
    } catch (e) {
      print("Error adding shoe: $e");
      rethrow; // Рethrow exception if needed
    }
  }

  Future<List<ShoesData>> getShoes() async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query('shoes');
    return result.map((e) => ShoesData.fromMap(e)).toList();
  }

  Future<int> deleteShoes(int id) async {
    final Database db = await initDB();
    return db.delete('shoes', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<ShoesData>> searchShoes(String keyword) async {
    final Database db = await initDB();
    List<Map<String, Object?>> searchResult = await db.rawQuery(
        "select * from shoes where shoesTitle LIKE ?", ["%$keyword%"]);
    return searchResult.map((e) => ShoesData.fromMap(e)).toList();
  }

  Future<int> updateShoes(title, id) async {
    final Database db = await initDB();
    return db
        .rawUpdate('update shoes set shoesTitle = ? where id = ?', [title, id]);
  }
}
