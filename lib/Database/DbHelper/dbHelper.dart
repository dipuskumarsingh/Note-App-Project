
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../Models/noteModels.dart';


class DbHelper{
  /// here make global variable
  DbHelper._();
  static DbHelper getInstance()=>DbHelper._();
  Database? mDB;


  /// here make table global variable

 static const NOTE_TABLE = 'Note';
 static const NOTE_ID = 'note_id';
 static const NOTE_TITLE = 'note_title';
 static const NOTE_DESCRIPTION = 'note_desc';
 static const DATE_TIME = 'date_time';

  /// get Db her...
 Future<Database>getDb()async{
    return mDB ??= await openDB();
  }


/// open Db here.....
  Future<Database> openDB()async{
    var appDir = await getApplicationDocumentsDirectory();
    String dbpath = join(appDir.path,"mainDb.db");
    return openDatabase(dbpath, version: 1,onCreate: (db, version){

      /// creating table for note app
      db.execute("creating table $NOTE_TABLE ( $NOTE_ID integer primary key autoincrement, $NOTE_TITLE text, $NOTE_DESCRIPTION text, $DATE_TIME text  )");
    });
  }


//Queries
  /// add Notes queries
Future<bool>addNotes({required noteModel newNoteModel})async{
var db = await getDb();
int rowsEffected = await db.insert(NOTE_TABLE, newNoteModel.toMap());
return rowsEffected > 0;
}

/// fetch all notes queries.

Future<List<noteModel>>fetchAllNotes()async{
   var db = await getDb();
   List<Map<String,dynamic>> mData = await db.query(NOTE_TABLE);
   List<noteModel> mNotes = [];
   for(int i = 0; i < mNotes.length; i++){
     noteModel eachNotes = noteModel.fromMaP(mData[i]);
    mNotes.add(eachNotes);
   }
   return mNotes;
}

}