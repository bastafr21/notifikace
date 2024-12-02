import 'package:flutter/material.dart';
import 'team_created.dart'; 

class CreateTeamScreen extends StatefulWidget {
  @override
  _CreateTeamScreenState createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  final _teamNameController = TextEditingController();
  final _teamDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Team"),
        backgroundColor: const Color.fromARGB(255, 154, 1, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);  // Navigate back to the previous screen (WhatToDoScreen)
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Enter Team Details",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _teamNameController,
              decoration: InputDecoration(
                labelText: "Team Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _teamDescriptionController,
              decoration: InputDecoration(
                labelText: "Team Description",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validate the fields
                if (_teamNameController.text.isNotEmpty &&
                    _teamDescriptionController.text.isNotEmpty) {
                  // Navigate to Team Created screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeamCreatedScreen(
                        teamName: _teamNameController.text,
                      ),
                    ),
                  );
                } else {
                  // Show error if fields are empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please fill all fields")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              ),
              child: Text("Create Team"),
            ),
          ],
        ),
      ),
    );
  }
}
