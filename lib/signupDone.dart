import 'package:exam3/login.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class signupDone extends StatefulWidget {
  Database? database;
  signupDone(this.database);

  @override
  State<signupDone> createState() => _signupDoneState();
}

class _signupDoneState extends State<signupDone> {
  Database? database;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    database=widget.database;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center
        ,children: [
        SizedBox(height: 100,),
        Center(child: Image(image: AssetImage("img/img_1.png"),height: 70,width: 150,)),
        Text("Forcasting",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(height: 180,),
          Center(child: Image(image: AssetImage("img/img_2.png"),height: 34,width: 120,fit: BoxFit.fill,),),
          SizedBox(height: 30,),
          Text("Congratulations",style: TextStyle(fontSize: 31,fontWeight: FontWeight.bold),),
          SizedBox(height: 27,),
          Text("Your Account Created",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.7)),textAlign: TextAlign.center,),
          Text("Succecfully",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.7)),textAlign: TextAlign.center),
          SizedBox(height: 190,),
          TextButton.icon(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return login(database);
            },));
          }, icon: Icon(Icons.arrow_back_ios_rounded,),
          label: Text("Back to Login",style: TextStyle(color: Colors.black,fontSize: 15),))
        ],),
      ),
    );
  }
}
