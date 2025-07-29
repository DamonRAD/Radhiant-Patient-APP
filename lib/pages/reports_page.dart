import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_header.dart';

class ReportsPage extends StatelessWidget {
  final String userName;

  const ReportsPage({super.key, this.userName = "Nomsa Mthembu"});

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
                    "Your Medical Reports",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  reportCard("Mammogram - Jan 2024", "Completed"),
                  reportCard("Ultrasound - Dec 2023", "In Progress"),
                  reportCard("X-ray - Nov 2023", "Pending"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget reportCard(String title, String status) {
    IconData icon;
    Color color;

    switch (status) {
      case "Completed":
        icon = Icons.check_circle;
        color = Colors.green;
        break;
      case "In Progress":
        icon = Icons.autorenew;
        color = Colors.orange;
        break;
      default:
        icon = Icons.schedule;
        color = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: color, size: 32),
        title: Text(title),
        subtitle: Text("Status: $status"),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // TODO: Navigate to report details
        },
      ),
    );
  }
}
