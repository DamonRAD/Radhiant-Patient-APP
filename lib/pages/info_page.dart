import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_header.dart';

class InfoPage extends StatelessWidget {
  final String userName;

  const InfoPage({super.key, this.userName = "Nomsa Mthembu"});

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
                  section("Contact Info", [
                    infoRow(Icons.email, "info@radhiant.co.za"),
                    infoRow(Icons.phone, "+27 81 234 5678"),
                    infoRow(Icons.location_on, "123 Health Street, Cape Town, South Africa"),
                  ]),
                  const SizedBox(height: 24),
                  section("Business Hours", [
                    infoRow(Icons.access_time, "Mon–Fri: 8AM–5PM"),
                    infoRow(Icons.access_time, "Sat: 9AM–1PM"),
                  ]),
                  const SizedBox(height: 24),
                  section("Website", [
                    infoRow(Icons.language, "www.radhiant.co.za"),
                  ]),
                  const SizedBox(height: 24),
                  section("Emergency", [
                    infoRow(Icons.warning, "Call 112 or visit nearest hospital"),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget section(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Widget infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
