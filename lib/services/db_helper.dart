import 'package:note_keeper/model/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  static final DatabaseHelper instance = DatabaseHelper._internal();
  static late Database _database;
  DatabaseHelper._internal();

 Future<Database> get database async{
    if(_database != null){
      return _database;
    }else{
      _database = await createDb();
      return _database;
    }
  }

  //CREATE/ INITIALIZE DATABASE
  Future<Database> createDb()async{
   final documentPath = await getDatabasesPath();
   final path = join(documentPath,'note_database.db');
   return await openDatabase(
     path,
     version: 1,
     onCreate: (db,version)async{
       await db.execute(
         '''
         CREATE table note(
         id INT PRIMARY KEY AUTOINCREMENT,
         priority INT,
         title TEXT,
         description TEXT
         ) 
         '''
       );
       
     }
   ); 
  }
  
  //INSERTION OPERATION
 insertion(NoteModel noteModel)async{
   final database = await _database;
   await database.insert('note', noteModel.toMap());
 }
  //FETCH OPERATION
  Future<List<NoteModel>> fetchData()async{
    final database= await _database;
    final JsonData = await database.query('notes');
    return  JsonData.map((mapObj)=>NoteModel.fromMapObj(mapObj)).toList();

}

}