import 'package:flutter/material.dart';
import 'main.dart';
import 'puppy.dart';

class IntermediatePage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Intermediate Lessons"),
      backgroundColor: Colors.blue),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children:[
                  GestureDetector(
                    onTap: () {
                      print("Current Lesson tapped");
                    },
                    child: Container(
                      height: 235,
                      color: Color.fromRGBO(33, 150, 243, 1).withOpacity(.2),
                      child: Center(
                        child: Text("Go To Bed/Kennel",
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
                    },
                    child: Container(
                      height: 235,
                      color: Color.fromRGBO(33, 150, 243, 1).withOpacity(.3),
                      child: Center(
                        child: Text("Crawl",
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
                    },
                    child: Container(
                      height: 235,
                      color: Color.fromRGBO(33, 150, 243, 1).withOpacity(.2),
                      child: Center(
                        child: Text("Roll Over",
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