import 'package:flutter/material.dart';
import 'main.dart';
import 'puppy.dart';
import 'sit.dart';
import 'laydown.dart';
import 'stay.dart';
import 'shake.dart';

class BasicsPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Basics Training"),
      backgroundColor: Colors.blue),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children:[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SitPage()),);
                    },
                    child: Container(
                      height: 205,
                      color: Color.fromRGBO(33, 150, 243, 1).withOpacity(.2),
                      child: Center(
                        child: Text("Sit",
                        style: TextStyle(fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => laydownPage()),);
                  
                    },
                    child: Container(
                      height: 205,
                      color: Color.fromRGBO(33, 150, 243, 1).withOpacity(.3),
                      child: Center(
                        child: Text("Lay Down",
                        style: TextStyle(fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StayPage()),);
                    },
                    child: Container(
                      height: 205,
                      color: Color.fromRGBO(33, 150, 243, 1).withOpacity(.2),
                      child: Center(
                        child: Text("Stay",
                        style: TextStyle(fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ShakePage()),);
                    },
                    child: Container(
                      height: 205,
                      color: Color.fromRGBO(33, 150, 243, 1).withOpacity(.3),
                      child: Center(
                        child: Text("Shake",
                        style: TextStyle(fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      ),
                  ),

                ],
                ),
            ),
          ],
        ),
    );
  }
  
}