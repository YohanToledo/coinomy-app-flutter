import 'package:coinomy/model/transaction_entity.dart';
import 'package:coinomy/model/users-entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database_connection.dart';

class TransactionsSQLiteDatasource {
  Future<List<Map<String, dynamic>>> getAllTransactions() async {
    final Database db = await DatabaseConnection.getDatabase();
    return await db.query('transactions');
  }

  Future<int> insertTransaction(TransactionEntity transaction) async {
    final Database db = await DatabaseConnection.getDatabase();
    return await db.insert('transactions', transaction.toMap());
  }
}
