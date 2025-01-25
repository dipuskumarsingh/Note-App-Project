

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app_ui/Database/DbHelper/dbHelper.dart';
import 'package:note_app_ui/Database/Models/noteModels.dart';
class addNotes extends StatelessWidget{
  TextEditingController _title = TextEditingController();

  TextEditingController _description = TextEditingController();

  DbHelper dbHelper = DbHelper.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top:50,left: 20,right: 20),
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff1e1f22),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xff3b3b3b),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(child: Icon(Icons.arrow_back,size: 35,color: Colors.white,)),
                  ),
                ),
                InkWell(
                  onTap: (){
                    dbHelper.addNotes(newNoteModel: noteModel(noteTitle: _title.text, noteDescription: _description.text));
                    Navigator.pop(context);
                   },
                    /// do save operation
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff3b3b3b),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(child: Text('Save',style: TextStyle(fontSize: 23,fontWeight:FontWeight.w500,letterSpacing:1,color: Colors.white),)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40,),
            TextField(
              controller: _title,style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: 'Lato',letterSpacing: 0.5),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: 'Title',
                  hintStyle: TextStyle(fontSize: 35,fontFamily: 'Lato',fontWeight: FontWeight.w500,wordSpacing: 1,color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    borderRadius: BorderRadius.zero
                  ),
              ),
            ),
            TextField(
              controller: _description,style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: 'Lato',letterSpacing: 0.5),
              cursorColor: Colors.white,
              maxLines: 8,
              minLines: 5,
              decoration: InputDecoration(
                hintText: 'Type something...',
                  hintStyle: TextStyle(fontSize: 28,fontFamily: 'Lato',fontWeight: FontWeight.w500,wordSpacing: 1,color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    borderRadius: BorderRadius.zero
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}