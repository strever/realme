import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

Database _db;
Future<Database> dbProvider() async {
  if(_db != null && _db.isOpen) {
    return _db;
  }

  Directory docDirectory  = await getApplicationDocumentsDirectory();
  String databasePath = join(docDirectory.path, 'realme.db');
  print('[/usr/local/opt/sqlite/bin/sqlite3 ${databasePath}]');
  //await deleteDatabase(databasePath);

  _db = await openDatabase(
    databasePath,
    version: 1,
//    onCreate: (Database database, int version) async {
//      await database.execute(_createTables);
//    },
  );

  String _createTables = '''
CREATE TABLE IF NOT EXISTS realme_note (
        id INTEGER PRIMARY KEY,
        title TEXT,
        note TEXT,
        synced INTEGER,
        deleted INTEGER,
        synced_at TEXT,
        created_at TEXT,
        updated_at TEXT
      );
''';

  _db.execute(_createTables);

  return _db;
}