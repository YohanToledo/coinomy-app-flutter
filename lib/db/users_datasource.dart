import 'package:coinomy/model/users-entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database_connection.dart';

class UsersSQLiteDatasource {
  Future<int> insertUser(UsersEntity user) async {
    final Database db = await DatabaseConnection.getDatabase();
    return await db.insert('user', user.toMap());
  }
}
