import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../widgets/app_drawer.dart';

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
  String password = "";

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (!mounted) return;

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      drawer: AppDrawer(),
      body: Padding(
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
                            ? FileImage(_profileImage!) as ImageProvider
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
              buildTextField("Password", password, (val) => password = val, obscureText: true),
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
    );
  }

  Widget buildTextField(String label, String initial, Function(String) onSave,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        initialValue: initial,
        obscureText: obscureText,
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
        validator: (val) => val == null || val.isEmpty ? "Required" : null,
        onSaved: (val) => onSave(val ?? ''),
      ),
    );
  }

  Widget buildDropdown(String label, String selected, List<String> options, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: selected,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        items: options
            .map((opt) => DropdownMenuItem(
          value: opt,
          child: Text(opt),
        ))
            .toList(),
        onChanged: (val) {
          if (val != null) onChanged(val);
        },
      ),
    );
  }
}
