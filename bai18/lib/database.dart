import 'dart:async';
import 'dart:io';
import 'package:bai18/main.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class SQLiteDbProvider {
  SQLiteDbProvider._();

  static final SQLiteDbProvider db = SQLiteDbProvider._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  final data = [
    {
      'title': 'samsung',
      'desc': 'samsung description',
      'coverUrl': 'assets/samsung.jpg',
    },
    {
      'title': 'iphone',
      'desc': 'iphone description',
      'coverUrl': 'assets/samsung.jpg',
    },

  ];

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "ItemDB.db");
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE Item ("
            "id INTEGER PRIMARY KEY,"
            "title TEXT,"
            "desc TEXT,"
            "coverUrl TEXT,"
            "rating INTEGER"
            ")");

        for (var element in data) {
          await db.execute(
              "INSERT INTO Item ('id', 'title', 'desc', 'coverUrl', 'rating') values (?, ?, ?, ?, ?)",
              [
                data.indexOf(element),
                element['title'],
                element['desc'],
                element['coverUrl'],
                0
              ]);
        }
      },
    );
  }

  Future<List<Item>> getItems() async {
    final db = await database;
    List<Map> results =
    await db!.query("Item", columns: Item.columns, orderBy: "id ASC");

    List<Item> items = [];
    for (var result in results) {
      Item item = Item.fromMap(result);
      items.add(item);
    }
    return items;
  }

  Future<Item?> getItemById(int id) async {
    final db = await database;
    var result = await db!.query("Item", where: "id = ", whereArgs: [id]);
    return result.isNotEmpty ? Item.fromMap(result.first) : null;
  }

  insert(Item item) async {
    final db = await database;
    var maxIdResult =
    await db!.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM Item");

    var id = maxIdResult.first["last_inserted_id"];
    var result = await db.rawInsert(
        "INSERT INTO Item ('id', 'title', 'desc', 'coverUrl', 'rating') VALUES (?, ?, ?, ?, ?)",
        [id, item.title, item.desc, item.coverUrl, item.rating]);
    return result;
  }

  update(Item item) async {
    final db = await database;
    var result = await db!
        .update("Item", item.toMap(), where: "id = ?", whereArgs: [item.id]);
    return result;
  }

  delete(int id) async {
    final db = await database;
    db!.delete("Item", where: "id = ?", whereArgs: [id]);
  }
}