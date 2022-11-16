
import 'package:latihan_restoapp/data/model/restaurant.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static late Database _database;
  static DatabaseHelper? _databaseHelper;

  static const String _tableName = 'restaurant';

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      "$path/restoapp_db.db",
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE $_tableName ('
            'id VARCHAR(100) PRIMARY KEY, '
            'name VARCHAR(30), '
            'pictureId VARCHAR(30), '
            'city VARCHAR(60), '
            'rating FLOAT, '
            'description TEXT'
          ')'
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertRestaurant(Restaurant restaurant) async {
    final Database db = await database;
    await db.insert(_tableName, restaurant.toMapDatabase());
  }

  Future<List<Restaurant>> getRestaurants() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((row) => Restaurant.fromMapDatabase(row)).toList();
  }

  Future<bool> isExists(String id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName, where: "id=?", whereArgs: [id]);
    return results.isNotEmpty;
  }

}