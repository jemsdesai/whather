import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'home1.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  Database? database;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirect();

  }

  redirect()async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return home1();
    },));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image(width: 215,height: 91,image: AssetImage("img/img.png")),),
          Text("Forcasting",style: TextStyle(color: Color(0xFF4A91FF),


              fontWeight: FontWeight.w800,
              fontSize: 45.8182
          ),)
        ],
      )),
    );
  }
}
