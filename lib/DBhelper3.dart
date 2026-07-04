import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper3 {
  static const String _dbName = 'All_database.db';
  static const String tableName = 'All_records';

  // Columns definition
  static const String colId = 'id';
  static const String colIncome = 'income_amount';
  static const String colExpence = 'expanse_amount';// Tip: You might want to rename this to colExpense later!
  static const String colDate = 'record_date';
  static const String colcategory = 'category';
  static const String colNote = 'note';

  // Private static instance of the database
  static Database? _database;

  // Getter to get the database instance safely
  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  // 1. Initialize and Open Database
  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableName (
            $colId INTEGER PRIMARY KEY AUTOINCREMENT,
            $colIncome REAL NOT NULL,
            $colExpence REAL NOT NULL,
            $colDate TEXT NOT NULL,
            $colcategory TEXT,
            $colNote TEXT
          )
        '''); // Added the missing comma here
      },
    );
  }     // double amount, String date, String category, String note

  // 2. Insert (Save) a new Expense Record
  static Future<int> insertIncome(double amount, String date, String category, String note,String Expence) async {
    final db = await DBHelper3.database;

    final data = {
      colIncome: amount,
      colDate: date,
      colcategory: category, // Fixed typo from 'chategory' to 'category'
      colNote: note,
      colExpence: Expence,
    };

    return await db.insert(
      tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // 3. Fetch (Get) all Records from the DB
  static Future<List<Map<String, dynamic>>> getAllRecords() async {
    final db = await DBHelper3.database;
    return await db.query(tableName, orderBy: '$colId DESC');
  }

  // All expenses add
  static Future<double> getTotalIncome() async {
    final db = await DBHelper3.database;

    final List<Map<String, dynamic>> result = await db.rawQuery(
        'SELECT SUM($colIncome) AS total FROM $tableName'
    );

    if (result.isNotEmpty && result.first['total'] != null) {
      return (result.first['total'] as num).toDouble();
    }
    return 0.0;
  }

  // 4. Delete a Record
  static Future<int> deleteRecord(int id) async {
    final db = await DBHelper3.database;
    return await db.delete(
      tableName,
      where: '$colId = ?',
      whereArgs: [id],
    );
  }
}