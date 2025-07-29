import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_header.dart';

class ServicesPage extends StatelessWidget {
  final String userName;

  const ServicesPage({super.key, this.userName = "Nomsa Mthembu"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        userName: userName,
        profileImagePath: 'assets/profile_placeholder.png',
      ),
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(
              profileImagePath: 'assets/profile_placeholder.png',
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const Text(
                    "Available Services",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  serviceCard("Mobile Mammography", "Get checked close to home."),
                  serviceCard("Ultrasound", "Quick and safe diagnostics."),
                  serviceCard("X-ray", "Convenient on-site imaging."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceCard(String title, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.medical_services, color: Colors.teal, size: 30),
        title: Text(title),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // TODO: Navigate to service details or scheduling
        },
      ),
    );
  }
}
