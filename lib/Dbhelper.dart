import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static const String _dbName = 'finance_database.db';
  static const String tableName = 'income_records';

  // Columns definition
  static const String colId = 'id';
  static const String colIncome = 'income_amount';
  static const String colDate = 'record_date';
  static const String colNotes = 'notes';

  // 1. Initialize and Open Database
  static Future<Database> openDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Creating the table with fields: id, income, date, and notes
        await db.execute('''
          CREATE TABLE $tableName (
            $colId INTEGER PRIMARY KEY AUTOINCREMENT,
            $colIncome REAL NOT NULL,
            $colDate TEXT NOT NULL,
            $colNotes TEXT
          )
        ''');
      },
    );
  }

  // 2. Insert (Save) a new Income Record
  static Future<int> insertIncome(double amount, String date, String notes) async {
    final db = await DBHelper.openDB();

    final data = {
      colIncome: amount,
      colDate: date,   // Stored as ISO8601 String (e.g., '2026-07-02')
      colNotes: notes,
    };

    return await db.insert(
      tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // 3. Fetch (Get) all Records from the DB
  static Future<List<Map<String, dynamic>>> getAllRecords() async {
    final db = await DBHelper.openDB();
    // Latest entries upar dikhane ke liye ordered by ID descending
    return await db.query(tableName, orderBy: '$colId DESC');
  }


  //all income add
  static Future<double> getTotalIncome() async {
    final db = await DBHelper.openDB();

    // SQLite ka SUM function use karke saare amounts ka total nikal rahe hain
    final List<Map<String, dynamic>> result = await db.rawQuery(
        'SELECT SUM($colIncome) AS total FROM $tableName'
    );

    // Agar database khali nahi hai, toh total return karega, nahi toh 0.0
    if (result.isNotEmpty && result.first['total'] != null) {
      return double.parse(result.first['total'].toString());
    }
    return 0.0;
  }

  // 4. Delete a Record (Optional but useful)
  static Future<int> deleteRecord(int id) async {
    final db = await DBHelper.openDB();
    return await db.delete(
      tableName,
      where: '$colId = ?',
      whereArgs: [id],
    );
  }
}