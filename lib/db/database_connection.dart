import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'create-tables.dart';

class DatabaseConnection {
  static Future<Database> getDatabase() async {
    // await deleteDatabase(
    //   join(await getDatabasesPath(), DATABASE_NAME),
    // );

    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) async {
        await db.execute(CREATE_USER_TABLE_SCRIPT);
        await db.rawInsert(''' insert into $USER_TABLE_NAME (
          $USER_COLUMN_NAME,
          $USER_COLUMN_EMAIL,
          $USER_COLUMN_PASSWORD)

        VALUES(
          'admin', 'admin@admin.com', 'admin321'  
        )''');

        await db.execute(CREATE_TRANSACTION_TABLE_SCRIPT);
      },
      version: 1,
    );
  }
}
