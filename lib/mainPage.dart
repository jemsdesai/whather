import 'package:flutter/material.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(23),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF47BFDF),
                  Color(0xFF4A91FF),
                ])),
        height: double.infinity,
        width: double.infinity,
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            SizedBox(height: 70,),
            InkWell(
              hoverColor: Colors.white,

              child: Row(
                children: [
                SizedBox(
                  height: 75,
                  width: 75,
                  child: Image(
                    image: AssetImage("img/sunny.png"), fit: BoxFit.contain,),
                ),
                SizedBox(width: 120,),
                Text("Sunny",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

              ],),
            ),
            SizedBox(height: 18,),
            InkWell(
              child: Row(
                children: [
                  SizedBox(
                    height: 75,
                    width: 75,
                    child: Image(
                      image: AssetImage("img/Pcloudy.png"), fit: BoxFit.contain,),
                  ),
                  SizedBox(width: 120,),
                  Text("Partly Cloudy",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

                ],),
            ),
            SizedBox(height: 18,),
            InkWell(
              child: Row(
                children: [
                  SizedBox(
                    height: 75,
                    width: 75,
                    child: Image(
                      image: AssetImage("img/cloudy.png"), fit: BoxFit.contain,),
                  ),
                  SizedBox(width: 120,),
                  Text("Cloudy",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

                ],),
            ),
            SizedBox(height: 18,),
            InkWell(
              child: Row(
                children: [
                  SizedBox(
                    height: 75,
                    width: 75,
                    child: Image(
                      image: AssetImage("img/rainy.png"), fit: BoxFit.contain,),
                  ),
                  SizedBox(width: 120,),
                  Text("Rainy",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

                ],),
            ),
            SizedBox(height: 18,),
            InkWell(
              child: Row(
                children: [
                  SizedBox(
                    height: 75,
                    width: 75,
                    child: Image(
                      image: AssetImage("img/snow.png"), fit: BoxFit.contain,),
                  ),
                  SizedBox(width: 120,),
                  Text("Snow",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

                ],),
            ),
            SizedBox(height: 18,),
            InkWell(
              child: Row(
                children: [
                  SizedBox(
                    height: 75,
                    width: 75,
                    child: Image(
                      image: AssetImage("img/stormy.png"), fit: BoxFit.contain,),
                  ),
                  SizedBox(width: 120,),
                  Text("Stormy",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

                ],),
            ),
            SizedBox(height: 18,),
            InkWell(
              child: Row(
                children: [
                  SizedBox(
                    height: 75,
                    width: 75,
                    child: Image(
                      image: AssetImage("img/thunder.png"), fit: BoxFit.contain,),
                  ),
                  SizedBox(width: 120,),
                  Text("Thunder",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

                ],),
            ),
          ],
        ),
      ),
    );
  }
}
