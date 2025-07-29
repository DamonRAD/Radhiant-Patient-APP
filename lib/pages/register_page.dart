import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _agreeToTerms = false;

  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildInput('First Name', onSaved: (val) => firstName = val),
              _buildInput('Last Name', onSaved: (val) => lastName = val),
              _buildInput('Email', keyboardType: TextInputType.emailAddress, onSaved: (val) => email = val),
              _buildInput('Phone Number', keyboardType: TextInputType.phone, onSaved: (val) => phone = val),
              _buildInput('Password', obscureText: true, onSaved: (val) => password = val),
              _buildInput('Confirm Password', obscureText: true, onSaved: (val) => confirmPassword = val),

              const SizedBox(height: 16),
              CheckboxListTile(
                value: _agreeToTerms,
                onChanged: (val) => setState(() => _agreeToTerms = val ?? false),
                title: const Text("I agree to the terms and conditions"),
                controlAffinity: ListTileControlAffinity.leading,
              ),

              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  if (!_agreeToTerms) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('You must accept the terms.')),
                    );
                    return;
                  }
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO: Submit registration data
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Account created.')),
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text('Create Account'),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                child: const Text("Already have an account? Sign In"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput(
    String label, {
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required Function(String) onSaved,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (val) => val == null || val.isEmpty ? 'Required' : null,
        onSaved: (val) => onSaved(val ?? ''),
      ),
    );
  }
}
