
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class third extends StatefulWidget {
  const third({Key? key}) : super(key: key);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();
  TextEditingController t4=TextEditingController();

  Database ?database;
  String cou="0";
  @override
  void initState() {
    super.initState();
    go();
  }
  go ()
  async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');


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
        body:Padding(padding: EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: t1,
                decoration: InputDecoration(hintText: "Full Name",border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              TextField(
                controller: t2,
                decoration: InputDecoration(hintText: "Phone Number",border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
              ),
              Padding(padding: EdgeInsets.only(top: 15)),

              Container(
                padding: EdgeInsets.all(10),

                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1,color: Colors.grey)

                ),
                child:   DropdownButton(isExpanded: true,value: cou,onChanged: (value) {
                  setState((){
                    cou=value.toString();
                  });
                },items: [
                  DropdownMenuItem(child: Text("Country"),value: "0",),
                  DropdownMenuItem(child: Text("India"),value: "1",),
                  DropdownMenuItem(child: Text("USA"),value: "2"),
                  DropdownMenuItem(child: Text("Russia"),value: "3"),
                ] ),

              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              TextField(
                controller: t3,
                decoration: InputDecoration(hintText: "Email",border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              TextField(
                controller: t4,
                obscureText: true,
                decoration: InputDecoration(hintText: "Password",border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              InkWell(
                onTap: () async{
                  String name=t1.text;
                  String number=t2.text;
                  String email=t3.text;
                  String password=t4.text;

                  String qry="insert into Test values(null,'$name','$number','$email','$password')";
                  print(qry);

                  int r_id;
                  r_id=await database!.rawInsert(qry);
                  print(" row_id= $r_id");


                  t1.text="";
                  t2.text="";
                  t3.text="";
                  t4.text="";
                  // Navigator.push(context , MaterialPageRoute(builder: (context) {
                  //   return fourth(database);
                  // },));

                },
                child: Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text("Singnup",style: TextStyle(fontSize: 20,color: Colors.white),),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an Account?",style: TextStyle(fontSize: 20,),),
                  TextButton(onPressed: () {

                  }, child: Text("Login",style: TextStyle(fontSize: 20),))
                ],)


            ],
          ),)
    );
  }
}
