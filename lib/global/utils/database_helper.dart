import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // ! private constructor
  DatabaseHelper._internal();
  static final DatabaseHelper instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return instance;
  }
// ! method to get database instance
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // ! get the path of the database
    String databasePath = await getDatabasesPath(); // data/dbpath
    String path = '${databasePath}pdf_books_lib.db';
    debugPrint('Db Path Set to:::::::::::::::::::: $path');
    //! open database
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS UserCredData (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        password TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ExpenseData (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        amount TEXT,
        date TEXT,
        details TEXT,
      )
    ''');
  }

//! CRUD methods
  Future<int> insert({String? table, Map<String, dynamic>? values}) async {
    Database db = await database;
    return await db.insert(table!, values!);
  }

  Future<List<Map<String, dynamic>>> queryAllRows({String? table}) async {
    Database db = await database;
    return await db.query(table!);
  }

//! query a specific row by id
  Future<Map<String, dynamic>?> queryRowById({String? table, int? id}) async {
    Database db = await database;
    List<Map<String, dynamic>> result =
        await db.query(table!, where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

//! Query a specific row by multiple clause
  Future<List<Map<String, dynamic>>?> queryRowByClause(
      {String? table, String? whereClause, List<dynamic>? whereArgs}) async {
    Database db = await database;
    List<Map<String, dynamic>> results =
        await db.query(table!, where: whereClause, whereArgs: whereArgs);
    return results;
  }

  Future<int> update({String? table, Map<String, dynamic>? values,
      String? whereClause, List<dynamic>? whereArgs}) async {
    Database db = await database;
    return await db.update(table!, values!,
        where: whereClause, whereArgs: whereArgs);
  }

  Future<int> delete(
      {String? table, String? whereClause, List<dynamic>? whereArgs}) async {
    Database db = await database;
    return await db.delete(table!, where: whereClause, whereArgs: whereArgs);
  }
}
