

import 'package:note_app_ui/Database/DbHelper/dbHelper.dart';

/// here makeing note model

class noteModel {
  int? Id;
  String noteTitle;
  String noteDescription;
  String? date_time;

  noteModel({ this.Id, required this.noteTitle, required this.noteDescription, this.date_time });

  /// from map
 factory noteModel.fromMaP(Map<String, dynamic> map ){
   return noteModel(
     Id: map[DbHelper.NOTE_ID],
     noteTitle: map[DbHelper.NOTE_TITLE],
     noteDescription: map[DbHelper.NOTE_DESCRIPTION],
     date_time: map[DbHelper.DATE_TIME]

   );
 }

 /// to map
   Map<String,dynamic>toMap(){
   return{
     DbHelper.NOTE_TITLE: noteTitle,
     DbHelper.NOTE_DESCRIPTION: noteDescription,
     DbHelper.DATE_TIME: date_time,
   };
  }
}