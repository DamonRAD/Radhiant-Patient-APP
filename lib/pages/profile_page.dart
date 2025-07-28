import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_header.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  File? _profileImage;

  String fullName = "Jane Doe";
  String email = "jane@example.com";
  String idNumber = "9001015800083";
  String gender = "Female";
  String phone = "0812345678";
  String dob = "1990-01-01";
  String address = "123 Main Street";
  String city = "East London";
  String province = "Eastern Cape";
  String postalCode = "5201";

  Future<void> _pickImage() async {
    // You can implement image picking logic here later
  }

  Widget buildTextField(String label, String initialValue, Function(String) onSaved, {bool obscureText = false}) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(labelText: label),
      obscureText: obscureText,
      validator: (value) => value == null || value.isEmpty ? 'Please enter $label' : null,
      onSaved: (value) => onSaved(value ?? ''),
    );
  }

  Widget buildDropdown(String label, String currentValue, List<String> options, Function(String) onChanged) {
    return DropdownButtonFormField<String>(
      value: currentValue,
      decoration: InputDecoration(labelText: label),
      items: options
          .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ))
          .toList(),
      onChanged: (value) {
        if (value != null) onChanged(value);
      },
      validator: (value) => value == null || value.isEmpty ? 'Please select $label' : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      drawer: AppDrawer(
        userName: fullName,
        profileImagePath: _profileImage?.path ?? 'assets/profile_placeholder.png',
      ),
      body: Column(
        children: [
          AppHeader(
            userName: fullName,
            profileImagePath: _profileImage?.path ?? 'assets/profile_placeholder.png',
            onProfileTap: _pickImage,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: _profileImage != null
                                  ? FileImage(_profileImage!)
                                  : AssetImage('assets/profile_placeholder.png') as ImageProvider,
                            ),
                            if (_profileImage == null)
                              Container(
                                width: 100,
                                height: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.camera_alt, color: Colors.white, size: 32),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    buildTextField("Full Name", fullName, (val) => fullName = val),
                    buildTextField("Email", email, (val) => email = val),
                    buildTextField("ID Number", idNumber, (val) => idNumber = val),
                    buildDropdown("Gender", gender, ["Female", "Male", "Other"], (val) {
                      setState(() => gender = val);
                    }),
                    buildTextField("Phone", phone, (val) => phone = val),
                    buildTextField("Date of Birth", dob, (val) => dob = val),
                    buildTextField("Address", address, (val) => address = val),
                    buildTextField("City", city, (val) => city = val),
                    buildTextField("Province", province, (val) => province = val),
                    buildTextField("Postal Code", postalCode, (val) => postalCode = val),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Profile updated.")),
                          );
                        }
                      },
                      child: Text("Update Profile"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
