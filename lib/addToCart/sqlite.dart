import 'package:path/path.dart';
import 'package:shoes_shop/JsonModels/shoes_data.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final databaseName = "note.db";

  String shoes = "CREATE TABLE shoes ("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "userId TEXT, " // Add this line
      "shoesId TEXT, "
      "shoesTitle TEXT, "
      "price TEXT, "
      "size TEXT, "
      "imageUrl TEXT)";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 3, onCreate: (db, version) async {
      await db.execute(shoes);
    }, onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < 2) {
        await db.execute(shoes);
      }
      if (oldVersion < 3) {
        await db.execute("ALTER TABLE shoes ADD COLUMN userId TEXT");
      }
    });
  }

  Future<int> addShoes(ShoesData shoe) async {
    final Database db = await initDB();
    return db.insert('shoes', shoe.toMap());
  }

  Future<List<ShoesData>> getShoes(String userId) async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query(
      'shoes',
      where: 'userId = ?', // Filter by userId
      whereArgs: [userId],
    );
    return result.map((e) => ShoesData.fromMap(e)).toList();
  }

  Future<int> deleteShoes(int id) async {
    final Database db = await initDB();
    return db.delete('shoes', where: 'id = ?', whereArgs: [id]);
  }
}
