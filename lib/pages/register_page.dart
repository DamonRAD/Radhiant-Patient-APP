import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool agreedToTerms = false;

  void _register() {
    if (!_formKey.currentState!.validate()) return;

    if (!agreedToTerms) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please agree to the terms.")));
      return;
    }

    // Simulate registration (replace with actual API call)
    print("Registering: ${_firstNameController.text} ${_lastNameController.text}");

    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String displayName = _firstNameController.text.isNotEmpty
        ? _firstNameController.text
        : 'New Patient';

    return Scaffold(
      appBar: AppBar(title: Text("Create Account")),
      drawer: AppDrawer(
        userName: displayName,
        profileImagePath: 'assets/profile_placeholder.png',
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: "First Name"),
                validator: (val) => val == null || val.isEmpty ? "Required" : null,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 12),

              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: "Last Name"),
                validator: (val) => val == null || val.isEmpty ? "Required" : null,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 12),

              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email Address"),
                keyboardType: TextInputType.emailAddress,
                validator: (val) =>
                    val == null || !val.contains('@') ? "Enter a valid email" : null,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 12),

              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: "Phone Number"),
                keyboardType: TextInputType.phone,
                validator: (val) => val == null || val.length < 10 ? "Enter a valid number" : null,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 12),

              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                validator: (val) => val == null || val.length < 6
                    ? "Password must be at least 6 characters"
                    : null,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 12),

              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Confirm Password"),
                validator: (val) =>
                    val != _passwordController.text ? "Passwords do not match" : null,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 16),

              Row(
                children: [
                  Checkbox(
                    value: agreedToTerms,
                    onChanged: (value) => setState(() => agreedToTerms = value!),
                  ),
                  Flexible(child: Text("I agree to the terms and conditions")),
                ],
              ),
              SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _register,
                  child: Text("Create Account"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
