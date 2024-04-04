import 'package:flutter/material.dart';
import 'package:pup_iq/puppy.dart';
import 'main.dart';
import 'editProfilePage.dart';
import 'newProfilePage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}


// TODO; put a "default profile", if the profile list is empty

// TODO: Starting to pass information between pages
class _ProfilePageState extends State<ProfilePage> {
  late puppy selectedItem;
  late List<puppy> currentList;

  @override
  void initState() {
    super.initState();
    currentList = globalService.getData(); 
    // This will have to change, if there is nothing in the list
    selectedItem = currentList.first; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: DropdownButton<puppy>(
              value: selectedItem,
              onChanged: (newValue) {
                setState(() {
                  selectedItem = newValue!;
                });
              },
              items: currentList.map<DropdownMenuItem<puppy>>((puppy value) {
                return DropdownMenuItem<puppy>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_circle), // Icon for the button
              onPressed: () {
                // Define the action when the button is pressed
                // For example, navigate to the settings page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewProfilePage()),
                );
              },
            ),
          ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 250,
                  color: Colors.blue,
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        ClipOval(
                          child: Image.asset(
                            'lesson.jpg',
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfilePage(toEdit : selectedItem)
                                ),
                            );
                          },
                          child: Text('Edit Profile'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  color: Color.fromRGBO(33, 150, 243, 1).withOpacity(.3),
                  child: Center(
                    child: Text(
                      "Breed",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  color: Color.fromRGBO(33, 150, 243, 1).withOpacity(.2),
                  child: Center(
                    child: Text(
                      "Age",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  color: Color.fromRGBO(33, 150, 243, 1).withOpacity(.3),
                  child: Center(
                    child: Text(
                      "Weight",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
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
