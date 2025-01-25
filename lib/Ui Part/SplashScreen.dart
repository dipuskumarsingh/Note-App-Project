import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_app_ui/Ui%20Part/NoteDesboard.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Splashscreen(),
    );
  }
}

class Splashscreen extends StatefulWidget{
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>noteDasboard()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/Icons/noteApp.png",width: 90,color: Colors.orange[600],),
            Text("notes",style: TextStyle(fontSize: 25,fontFamily: 'italicFonts',letterSpacing:2,fontWeight: FontWeight.w500,color: Colors.orange[600],),)
          ],
        ),
      ),
    );
  }
}
