import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/transaction_entity.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, 'transactions.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE transactions(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            type TEXT,
            value REAL,
            description TEXT
          )
        ''');
      },
    );
  }

  Future<List<Map<String, dynamic>>> getAllTransactions() async {
    final Database db = await database;
    return await db.query('transactions');
  }

  Future<int> insertTransaction(TransactionEntity transaction) async {
    final Database db = await database;
    return await db.insert('transactions', transaction.toMap());
  }
}
