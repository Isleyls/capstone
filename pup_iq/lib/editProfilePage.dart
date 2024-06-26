import 'package:flutter/material.dart';
import 'package:pup_iq/main.dart';
import 'package:pup_iq/profilePage.dart';
import 'puppy.dart';

class EditProfilePage extends StatefulWidget {
  final puppy toEdit;

  EditProfilePage({required this.toEdit});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String newName = "";
  String newAge = "";
  String newBreed = "";
  String newWeight = "";

  late puppy toEdit;
  var nameFieldController = TextEditingController();
  var ageFieldController = TextEditingController();
  var weightFieldController = TextEditingController();
  var breedFieldController = TextEditingController();
  late String selectedProfilePicture = 'lesson.jpg'; // Default profile picture

  // Define profilePictures list
  List<String> profilePictures = [
    'lesson.jpg',
    'brown.jpg',
    'black.jpg',
    'yellow.jpg',

    // Add more image paths here as needed
  ];

  @override
  void initState() {
    super.initState();
    toEdit = widget.toEdit;
    selectedProfilePicture = toEdit.getImagePath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // send an alert to ensure the user wants to delete the profile,
              showDeleteConfirmationDialog(context);
            },
            child: Text("Delete Profile"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
          )
        ],
      ),
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
                            selectedProfilePicture,
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.edit),
                            color: Colors.blue,
                            onPressed: () {
                              _showProfilePictureSelectionDialog(context);
                              //showImageConfirmationDialog(context);

                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // Remaining form fields and buttons
                // ...
              Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: nameFieldController,
                            decoration: InputDecoration(
                              labelText: "Enter your pet's name",
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Action to perform when the submit button is pressed
                            newName = nameFieldController
                                .text; // grab the text from the field
                            globalService.editName(toEdit,
                                newName); // edit the name through the service
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ),
                            );
                          },
                          child: Text("Submit"),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: breedFieldController,
                            decoration: InputDecoration(
                              labelText: "Enter your pet's breed",
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Action to perform when the submit button is pressed
                            newBreed = breedFieldController
                                .text; // grab the text from the field
                            globalService.editBreed(toEdit,
                                newBreed); // edit the name through the service

                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ),
                            );
                          },
                          child: Text("Submit"),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: ageFieldController,
                            decoration: InputDecoration(
                              labelText: "Enter your pet's Age",
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Action to perform when the submit button is pressed
                            newAge = ageFieldController
                                .text; // grab the text from the field
                            print(ageFieldController.text);

                            globalService.editAge(toEdit,
                                newAge); // edit the name through the service

                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ),
                            );
                          },
                          child: Text("Submit"),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: weightFieldController,
                            decoration: InputDecoration(
                              labelText: "Enter your pet's weight",
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            newWeight = weightFieldController
                                .text; // grab the text from the field
                            globalService.editWeight(toEdit,
                                newWeight); // edit the name through the service

                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ),
                            );
                          },
                          child: Text("Submit"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
  void _showProfilePictureSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Choose Profile Picture"),
          content: Container(
            width: double.maxFinite,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: profilePictures.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedProfilePicture = profilePictures[index];
                    });
                    Navigator.pop(context);
                    showImageConfirmationDialog(context);

                  },
                  child: Image.asset(
                    profilePictures[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Profile"),
          content: Text("Are you sure you want to delete the profile?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Perform deletion logic here (call to delete in globalService)
                globalService.deletePuppy(toEdit);
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
              child: Text(
                "Delete",
                style: TextStyle(
                  color: Colors.red, // Change the text color if needed
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
  void showImageConfirmationDialog(BuildContext context) {
   
             
                // Perform deletion logic here (call to delete in globalService)
                globalService.updateProfilePicture(toEdit, selectedProfilePicture);
                Navigator.of(context).pop(); // Close the dialog
               
                Navigator.pushReplacement
                (
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
  }
}
