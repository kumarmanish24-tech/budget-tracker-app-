import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper2 {
  static const String _dbName = 'Expanse_database.db';
  static const String tableName = 'expanse_records';

  // Columns definition
  static const String colId = 'id';
  static const String colIncome = 'expanse_amount'; // Tip: You might want to rename this to colExpense later!
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
            $colDate TEXT NOT NULL,
            $colcategory TEXT,
            $colNote TEXT
          )
        '''); // Added the missing comma here
      },
    );
  }

  // 2. Insert (Save) a new Expense Record
  static Future<int> insertIncome(double amount, String date, String category, String note) async {
    final db = await DBHelper2.database;

    final data = {
      colIncome: amount,
      colDate: date,
      colcategory: category, // Fixed typo from 'chategory' to 'category'
      colNote: note,
    };

    return await db.insert(
      tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // 3. Fetch (Get) all Records from the DB
  static Future<List<Map<String, dynamic>>> getAllRecords() async {
    final db = await DBHelper2.database;
    return await db.query(tableName, orderBy: '$colId DESC');
  }

  // All expenses add
  static Future<double> getTotalIncome() async {
    final db = await DBHelper2.database;

    final List<Map<String, dynamic>> result = await db.rawQuery(
        'SELECT SUM($colIncome) AS total FROM $tableName'
    );

    if (result.isNotEmpty && result.first['total'] != null) {
      return (result.first['total'] as num).toDouble();
    }
    return 0.0;
  }


  static Future<double> getTotalIncomeForToday() async {
    final db = await DBHelper2.database;

    // 🌟 Sirf aaj ki date ka data nikalega (Raat 12 baje ke baad automatic 0 ho jayega)
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT SUM($colIncome) as total FROM $tableName WHERE date($colDate) = date('now')"
    );

    if (maps.first['total'] != null) {
      return maps.first['total'] as double;
    }
    return 0.0;
  }

  // 4. Delete a Record
  static Future<int> deleteRecord(int id) async {
    final db = await DBHelper2.database;
    return await db.delete(
      tableName,
      where: '$colId = ?',
      whereArgs: [id],
    );
  }
}