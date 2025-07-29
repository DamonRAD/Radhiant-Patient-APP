import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController =
      TextEditingController(text: 'Nomsa Mthembu');
  final TextEditingController _emailController =
      TextEditingController(text: 'nomsa@example.com');
  final TextEditingController _phoneController =
      TextEditingController(text: '0812345678');
  final TextEditingController _idController =
      TextEditingController(text: '123456789');
  final TextEditingController _addressController =
      TextEditingController(text: '123 Main Street');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _idController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(
        userName: "Nomsa Mthembu",
        profileImagePath: 'assets/profile_placeholder.png',
      ),
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(
              profileImagePath: 'assets/profile_placeholder.png',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 40, 16, 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      buildTextField(_nameController, 'Full Name'),
                      buildTextField(_emailController, 'Email Address'),
                      buildTextField(_phoneController, 'Phone Number'),
                      buildTextField(_idController, 'ID Number'),
                      buildTextField(_addressController, 'Address'),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _submit,
                          child: const Text("Update Profile"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile updated successfully.")),
      );
    }
  }
}
