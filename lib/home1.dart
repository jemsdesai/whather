
import 'package:exam3/signUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class home1 extends StatefulWidget {
  const home1({Key? key}) : super(key: key);

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  Database? database;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    go();
  }
  go ()
  async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath,'demo.db');


// open the database
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE Test (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,number TEXT,email TEXT,password TEXT)');
        });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 370,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("img/map.png"),fit: BoxFit.cover)
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 20,left: 10,right: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              width: 350,
              height: 350,
              child: Column(
                children: [

                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Expore global map of wind, weather, and ocean conditions",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Planing your trip become more easier with ideate weather app. you can instantly see the whole word weather within few second",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return signUp(database);
                        },
                      ));
                    },
                    child: Center(
                      child: Container(
                        child: Center(
                            child: Text("Get Started",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ))),
                        width: 264,
                        height: 60,
                        decoration: (BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF47BFDF),
                                  Color(0xFF4A91FF),
                                ]))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account ?"),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Log In",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF47BFDF),
              Color(0xFF4A91FF),
            ])),
      ),
    );
  }
}
