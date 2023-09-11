import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'Profile.dart';

void main() {
  runApp(RegisterPage());
}

class UserData {
  var username = ''.obs;
  var name = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var address = ''.obs;
  var profileImage = ''.obs;
}

class RegisterPage extends StatelessWidget {
  final UserData userData = UserData();

  void _submitForm() {
    Get.to(ProfilePage(userData: userData));
  }

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      userData.profileImage.value = pickedFile.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Input User Data'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (value) => userData.username.value = value,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 16),
              TextFormField(
                onChanged: (value) => userData.name.value = value,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 16),
              TextFormField(
                onChanged: (value) => userData.email.value = value,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 16),
              TextFormField(
                onChanged: (value) => userData.phoneNumber.value = value,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(height: 16),
              TextFormField(
                onChanged: (value) => userData.address.value = value,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _getImage(),
                child: Text('Pick Profile Image'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _submitForm(),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
