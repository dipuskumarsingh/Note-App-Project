

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class updateNotes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        color: Color(0xff1e1f22),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xff3b3b3b),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Icon(Icons.arrow_back,size: 38,color: Colors.white,),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xff3b3b3b),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(child: Image.asset('assets/Icons/edit (1).png',color: Colors.white,)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text("This block is used fot the Title block whic was fatch from  the DB helper.",style: TextStyle(fontSize: 28,fontFamily: "Lato",letterSpacing: 2,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 20,),
            Text("May 21, 2022",style: TextStyle(fontSize: 18,fontFamily: "Lato",letterSpacing: 2,color: Colors.grey),),
            SizedBox(height: 20,),
            Text("This block is used fot the Description block whic was fatch from  the DB helper.",style: TextStyle(fontSize: 20,fontFamily: "Lato",letterSpacing: 1,color: Colors.white),),

          ],
        ) ,
      ),
    );
  }
}