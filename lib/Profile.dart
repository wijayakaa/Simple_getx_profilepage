import 'dart:io';
import 'package:flutter/material.dart';
import 'Register.dart';

class ProfilePage extends StatelessWidget {
  final UserData userData;

  ProfilePage({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Data Result')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              userData.profileImage.value.isNotEmpty
                  ? ClipOval(
                      child: Image.file(
                        File(userData.profileImage.value),
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(),
              SizedBox(height: 16),
              Text('Username: ${userData.username}'),
              SizedBox(height: 8),
              Text('Name: ${userData.name}'),
              SizedBox(height: 8),
              Text('Email: ${userData.email}'),
              SizedBox(height: 8),
              Text('Phone Number: ${userData.phoneNumber}'),
              SizedBox(height: 8),
              Text('Address: ${userData.address}'),
            ],
          ),
        ),
      ),
    );
  }
}