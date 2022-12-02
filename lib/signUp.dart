import 'dart:developer';

import 'package:exam3/signupDone.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'login.dart';

class signUp extends StatefulWidget {
  Database? database;
  signUp(this.database);
  @override
  State<signUp> createState() => _signUpState();
}
// {
// "name": "suman",
// "email": "suman@email.com",
// "phone": "9932448855",
// "password": "Password@123",
// "country": "india"
// }
class _signUpState extends State<signUp> {
  Database? database;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    database=widget.database;
  }

  var items = [
    'India',
    'U S A',
    'Canada',
    'U.K',
    'Rasia',
  ];
  createmenu() {
    return items
        .map<DropdownMenuItem<String>>(
            (e) => DropdownMenuItem(value: e, child: Text(e)))
        .toList();
  }
  TextEditingController name_c=TextEditingController();
  TextEditingController num_c=TextEditingController();
  TextEditingController email_c=TextEditingController();
  TextEditingController pass_c=TextEditingController();
  String selected="India";
  bool isFilled=false;


  insertIt()async{
    String name=name_c.text;
    String number=num_c.text;
    String email=email_c.text;
    String password=pass_c.text;
    String qry="insert into Test values(null,'$name','$number','$email','$password')";


    int r_id;
    r_id=await database!.rawInsert(qry);
    log(" row_id= $r_id");

  }
  @override
  Widget build(BuildContext context) {
   check(){
     if(name_c.text==""){
       isFilled=false;

     }
     else if(num_c.text==""){
       isFilled=false;
     }
     else if(email_c.text==""){
       isFilled=false;
     }

     else if(  pass_c.text==""){
       isFilled=false;
     }

     else{
       setState((){ isFilled=true;});
     }

   }
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center
        ,children: [
          SizedBox(height: 100,),
          Center(child: Image(image: AssetImage("img/img_1.png"),height: 70,width: 150,)),
          Text("Forcasting",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),

          Text("Enter your email address and password",style: TextStyle(fontSize: 17,color: Colors.grey),),
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              border:Border.all(color: Colors.grey,width: 1)
            ,borderRadius: BorderRadius.circular(14)
            ),

            child: TextField(controller: name_c,
           onChanged: (v){
              check();
           },
           // enableInteractiveSelection: false,
            decoration: InputDecoration(hintText: "Full Name",border: InputBorder.none,),

            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              border:Border.all(color: Colors.grey,width: 1)
            ,borderRadius: BorderRadius.circular(14)
            ),

            child: TextField(controller: num_c,
              onChanged: (v){
                check();
              },
           // enableInteractiveSelection: false,
            decoration: InputDecoration(hintText: "Phone Number",border: InputBorder.none,),

            ),
          ),

          Container(
            padding: EdgeInsets.all(3),
          child:DropdownButtonHideUnderline(
            child: DropdownButton(
             // hint: Text("$city"),
              isExpanded: true,
              value: selected,
              iconSize: 30,
              items: createmenu(),
              onChanged: (String? value) {
                setState(() {
                  selected = value ?? "";
                });
              },
            ),
          )
          , margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
          height: 55,
          width: double.infinity,
            decoration: BoxDecoration(
                border:Border.all(color: Colors.grey,width: 1)
                ,borderRadius: BorderRadius.circular(14)
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                border:Border.all(color: Colors.grey,width: 1)
                ,borderRadius: BorderRadius.circular(14)
            ),

            child: TextField(controller: email_c,
              onChanged: (v){
                check();
              },
              // enableInteractiveSelection: false,
              decoration: InputDecoration(hintText: "Email",border: InputBorder.none,),

            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                border:Border.all(color: Colors.grey,width: 1)
                ,borderRadius: BorderRadius.circular(14)
            ),

            child: TextField(obscureText: true,controller: pass_c,
              onChanged: (v){
                check();
              },
              // enableInteractiveSelection: false,
              decoration: InputDecoration(hintText: "Password",border: InputBorder.none,),

            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(onPressed: (){
            print("object");
       if(isFilled)
         {

           insertIt();
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
               log("SignUp done");
               return signupDone(database);
             },));

           name_c.text="";
           num_c.text="";
           email_c.text="";
           pass_c.text="";
         }
       else
         {
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Fill all Detail")));
         }
            //     selected="Country";
          },style: ElevatedButton.styleFrom(primary: Colors.white70,elevation: 0),child: Container(
            child: Center(child: Text("Sign Up",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25,))),
            width: 350,
            height: 50,
            decoration: (
                BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                    ,gradient: isFilled?LinearGradient(  begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,colors: [
                      Color(0xFF47BFDF),
                      Color(0xFF4A91FF),
                    ]):LinearGradient(colors: [Colors.grey,Colors.grey])

                )
            ),
          )),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account ?"),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return login(database);
                    },));
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          )
          // InkWell(
          //
          //     onTap: (){
          //       print("call");
          //      //  name_c.text="";
          //      //  num_c.text="";
          //      //  email_c.text="";
          //      //  pass_c.text="";
          //      // // selected="Country";
          //     },
          //
          //   child: Container(
          //     child: Center(child: Text("Sign Up",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25,))),
          //     width: 350,
          //     height: 60,
          //     decoration: (
          //         BoxDecoration(
          //             borderRadius: BorderRadius.all(Radius.circular(15))
          //             ,gradient: isFilled?LinearGradient(  begin: Alignment.topCenter,
          //             end: Alignment.bottomCenter,colors: [
          //               Color(0xFF47BFDF),
          //               Color(0xFF4A91FF),
          //             ]):LinearGradient(colors: [Colors.grey,Colors.grey])
          //
          //         )
          //     ),
          //   ),
          // ),
        ],),
      ),
    );
  }
}
