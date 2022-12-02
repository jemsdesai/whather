import 'dart:developer';

import 'package:exam3/mainPage.dart';
import 'package:exam3/signUp.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class login extends StatefulWidget {
  Database? database;

  login(this.database);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email_c = TextEditingController();
  TextEditingController pass_c = TextEditingController();
  bool isFilled = false;
  Database? database;
  List<Map<String, Object?>> Alluser = [];
  Map user={};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    database = widget.database;
    getUser();
  }

  getUser() async {
    String qry = "select * from Test";
    Alluser = await database!.rawQuery(qry);


    log("${Alluser}");


  }

  @override
  Widget build(BuildContext context) {
    check() {
      if (email_c.text == "") {
        isFilled = false;
      }

      else if (pass_c.text == "") {
        isFilled = false;
      }

      else {
        setState(() {
          isFilled = true;
        });
      }
    }
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center
          , children: [
          SizedBox(height: 100,),
          Center(child: Image(
            image: AssetImage("img/img_1.png"), height: 70, width: 150,)),
          Text("Forcasting",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Text("Enter your email address and password",
            style: TextStyle(fontSize: 17, color: Colors.grey),),
          SizedBox(height: 33,),


          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1)
                , borderRadius: BorderRadius.circular(14)
            ),

            child: TextField(controller: email_c,
              onChanged: (v) {
                check();
              },
              // enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: "Email", border: InputBorder.none,),

            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1)
                , borderRadius: BorderRadius.circular(14)
            ),

            child: TextField(obscureText: true, controller: pass_c,
              onChanged: (v) {
                check();
              },
              // enableInteractiveSelection: false,
              decoration: InputDecoration(
                hintText: "Password", border: InputBorder.none,),

            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(onPressed: () {
            print("object");
            if (isFilled) {
              int userIndex,i=0;
              bool isUserExist=false;
              //find User prosses
              Alluser.forEach((e) {
                if(e['email']==email_c.text)
                  {
                    userIndex=i;
                    if(e['password']==pass_c.text)
                      {
                        isUserExist=true;
                        log("Log in Successfull");
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return mainPage();
                        },));
                      }
                    else
                      {
                        isUserExist=true;
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please Enter Correct Password", style: TextStyle(color: Colors.white),),
                          backgroundColor: Colors.redAccent,)) ;
                      }
                  }
              });
              if(!isUserExist)
              {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("User Not Exists", style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.redAccent,)) ;

              }
            }
            else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Please Fill all Detail")));
            }
            //     selected="Country";
          },
              style: ElevatedButton.styleFrom(
                  primary: Colors.white70, elevation: 0),
              child: Container(
                child: Center(child: Text("Login", textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25,))),
                width: 350,
                height: 50,
                decoration: (
                    BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                        ,
                        gradient: isFilled ? LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter, colors: [
                          Color(0xFF47BFDF),
                          Color(0xFF4A91FF),
                        ]) : LinearGradient(colors: [Colors.grey, Colors.grey])

                    )
                ),
              )),
          SizedBox(height: 250),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Dont't have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) {
                      return signUp(database);
                    },));
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(decoration: TextDecoration.underline,
                        color: Colors.blue),
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
