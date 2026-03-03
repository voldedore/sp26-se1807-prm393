import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/note.dart';

class DatabaseHelper {
  // Cac thuoc tinh lien quan den DB Sqlite
  static const _databaseName = 'se1807_notemanagement.db';
  static const _databaseVersion = 1;

  // Lien quan den model Note
  static const _noteTableName = 'notes';

  // Singleton pattern
  // đảm bảo chỉ tồn tại 1 và duy nhất 1 object (instance, đối tượng) database helper trong ht.
  DatabaseHelper._privateConstructor();

  // Instance (1 đối tượng) đang kết nối db
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Object database
  static Database? _database;

  // getter
  // Neu ton tai object database, thi return, neu ko thi init
  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  // init database
  // 1. Xac dinh path luu db
  // 2. Mở kết nối db
  // 3. Trong quá trình kết nối lần đầu, thực hiện 1 số job (tạo bảng, index, fill data...)
  // 4. return db
  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);
    // debug in thu path
    print('DB PATH: $path');
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  // fn để init db tạo bảng...
  Future<void> _onCreate(Database db, int version) async {
    // Cau lenh tao bang
    // AutoIncrement = tự tăng (Identity)
    await db.execute('''
      CREATE TABLE $_noteTableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        title TEXT NOT NULL,
        content TEXT NOT NULL
      )
    ''');
  }

  // CRUD

  // -------- LIST -------------
  Future<List<Note>> getList() async {
    final db = await database;
    List<Map<String, Object?>> maps = await db.query(
        _noteTableName, orderBy: 'id desc');

    // Raw result set cua lenh db.query() tra ve 1 cai List cua Map
    // [
    //   { 'col1': 'value', 'col2': 'value' },
    //   { 'col1': 'value', 'col2': 'value' },
    //   { 'col1': 'value', 'col2': 'value' },
    // ]

    return [for (final map in maps) Note.fromJson(map)];
  }

  // -------- CREATE -------------
  Future<int> create(Note note) async {
    final db = await database;
    return db.insert(
        _noteTableName,
        note.toJson(),
        // conflictAlgorithm: ConflictAlgorithm.replace, // replace = neu trung id thi thay the
        // conflictAlgorithm: ConflictAlgorithm.ignore, // ignore = neu trung id thi boqua
    );
  }

  // -------- UPDATE -------------
  // -------- DELETE -------------
  Future<int> delete(int id) async {
    final db = await database;
    // Lu7u ý: SQL injection -> Sử dụng đúng convention của API của SQfLite
    return db.delete(_noteTableName, where: 'id = ?', whereArgs: [id]);
  }
// -------- GET BY ID -------------


}