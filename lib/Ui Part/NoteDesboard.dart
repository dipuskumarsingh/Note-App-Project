


import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_app_ui/Database/DbHelper/dbHelper.dart';
import 'package:note_app_ui/Database/Models/noteModels.dart';
import 'package:note_app_ui/Ui%20Part/NoteAddingScreen.dart';
import 'package:note_app_ui/Ui%20Part/upDateNotes.dart';

class noteDasboard extends StatefulWidget{
  @override
  State<noteDasboard> createState() => _noteDasboardState();

}

class _noteDasboardState extends State<noteDasboard> {
  static DbHelper dbHelper = DbHelper.getInstance();
  static List<Map<String,dynamic>> mData = [
  {'title': "this is new sdijkf dksfj sdfjds", 'title2': "this and solve this probledsfkj lkkjfdsjfjlk lkjdslkfkjsd;lkjf lldsjflklm"},
  {'title': "this is new", 'title2': "this and solve this  lkjdslkfkjsd;lkjf lldsjflklm"},
  {'title': "this is new", 'title2': "this and solve this fdsjfjlk lkjdslkfkjsd;lldsjflklm"},
  {'title': "this is new", 'title2': "this and solve this pfdsjfjlk hjhj jhlkjf lldsjflklm"},
  {'title': "this is new", 'title2': "this and solve this pfdsjfjlk hjhj jhlkjf lldsjflklm"},
  {'title': "this is new", 'title2': "this and solve this pfdsjfjlk hjhj jhlkjf lldsjflklm"},
  {'title': "this is new", 'title2': "this and solve this pfdsjfjlk hjhj jhlkjf lldsjflklm"},
  ];
   List<noteModel> mNotes =[];
  @override
  void initState() {
    super.initState();
   getNots();
  }
getNots()async{
    mNotes = await dbHelper.fetchAllNotes();
   setState(() {

   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        // backgroundColor: Colors.grey[800],
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> addNotes()));
      },child: Icon(Icons.add,size: 40,color: Colors.black,),),
      appBar: AppBar(
          actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Notes',style: TextStyle(fontSize: 35,fontFamily: 'Lato',fontWeight: FontWeight.w500,color: Colors.white,letterSpacing: 2),),
              SizedBox(width: 225,),
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xff3b3b3b),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(child: Icon(Icons.search,size: 38,color: Colors.white,))),
            ],
          ),
        ),
      ],
          backgroundColor:Color(0xff1e1f22)),
      body: Container(
        width: double.infinity,
        height: double.infinity,
          color: Color(0xff1e1f22),
        child:  Container(   ///mNotes.isNotEmpty ?
          margin: EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: [
              SizedBox(height:10,),
              Expanded(
                child: GridView.builder(
                    itemCount:mData.length ,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3/3.5,crossAxisSpacing: 15,mainAxisSpacing: 15), itemBuilder: (_,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>updateNotes()));
                      /// Here we do Update operation
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.primaries[Random().nextInt(Colors.primaries.length-1)].shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(mData[index]['title'],style: TextStyle( fontSize: 25,fontWeight: FontWeight.w600,fontFamily: 'Lato',overflow: TextOverflow.fade),),
                            Text("May 21, 2000",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.blueGrey[700]),)
                          ],
                        ),
                    ),
                  );
                }),
              ),
            ],
          ),
        )///:Center(child: Text('No notes',style: TextStyle(fontSize:25,fontFamily:'Lato',color: Colors.white),))
      ),
    );
  }
}




























//
// mNotes.isNotEmpty ? GridView.builder(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
// itemBuilder: (_,index){
// return Container(
// child: Column(
// children: [
// ],
// ),
// );
// }): Container(
// child: Center(child: Text("No Notes found!",style: TextStyle(color: Colors.white,),)),
// ),