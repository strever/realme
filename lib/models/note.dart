import 'package:date_format/date_format.dart';
import 'package:realme/models/db_provider.dart';
import 'package:sqflite/sqflite.dart';

class Note {
  static final List<String> dateFormat = [
    'yyyy',
    '-',
    'mm',
    '-',
    'dd',
    ' ',
    'HH',
    ':',
    'nn',
    ':',
    'ss'
  ];
  int id;
  String title = '';
  String note = '';
  int synced = 0;
  int deleted = 0;
  String syncedAt = '';
  String createdAt = formatDate(DateTime.now(), dateFormat);
  String updatedAt = formatDate(DateTime.now(), dateFormat);

  static String table = 'realme_note';

  Note({int id = 0}) {
    if (id > 0) this.find(id);
  }

  Future<int> save() async {
    Database db = await dbProvider();
    int id = 0;
    if (this.id != null && this.id > 0) {
      id = await db.update(table, {
        "id": this.id,
        "title": this.title,
        "note": this.note,
        "synced": this.synced,
        "deleted": this.deleted,
        "synced_at": this.syncedAt,
        "created_at": this.createdAt,
        "updated_at": this.updatedAt,
      }, where: "id = ${this.id}");
    } else {
      id = await db.insert(table, {
        "title": this.title,
        "note": this.note,
        "synced": this.synced,
        "deleted": this.deleted,
        "synced_at": this.syncedAt,
        "created_at": this.createdAt,
        "updated_at": this.updatedAt,
      });
    }
    //await db.close();

    return id;
  }

  Future<Map<String, dynamic>> find(int id) async {
    Database db = await dbProvider();
    List<Map<String, dynamic>> rows =
        await db.rawQuery('SELECT * FROM ${table} WHERE id = ${id} ');
    Map<String, dynamic> row = rows[0] ?? {};
    if (row.isNotEmpty) {
      this.id = id;
      this.title = row['title'];
      this.note = row['note'];
      this.synced = row['synced'];
      this.deleted = row['deleted'];
      this.syncedAt = row['synced_at'];
      this.createdAt = row['created_at'];
      this.updatedAt = row['updated_at'];
    }

    //await db.close();

    return row;
  }

  static Future<List<Note>> findAll() async {
    List<Note> notes = [];
    Database db = await dbProvider();
    List<Map<String, dynamic>> rows = await db.rawQuery(
        'SELECT * FROM ${table} WHERE deleted = 0 ORDER BY updated_at DESC');
    if (rows.isNotEmpty) {
      rows.forEach((row) {
        Note note = Note();
        note.id = row['id'];
        note.title = row['title'];
        note.note = row['note'];
        note.synced = row['synced'];
        note.deleted = row['deleted'];
        note.syncedAt = row['synced_at'];
        note.createdAt = row['created_at'];
        note.updatedAt = row['updated_at'];
        notes.add(note);
      });
    }

    //await db.close();

    return notes;
  }
}
