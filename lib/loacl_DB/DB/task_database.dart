
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:task_adder_app/loacl_DB/model/task_model.dart';

class TaskDatabase {
  static Database ? _db;
  static Future<Database>getDB() async{
    if (_db != null) return _db!;

    _db = await openDatabase(
    p.join(await getDatabasesPath(),'task.db'),
      onCreate: (db, version){
      return db.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT,isDone INTEGER)");
      },
      version: 2
    );
    return _db!;
  }

  static Future<void>insertTask(Task task)async {
    final db = await getDB();
    db.insert('tasks', task.toMap(), conflictAlgorithm: .replace);
  }

  static Future<List<Task>>getTask(Task task)async {
    final db = await getDB();
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i)=>Task.formMap(maps[i]));
  }
}

