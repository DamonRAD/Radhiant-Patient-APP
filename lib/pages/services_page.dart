import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_header.dart';

class ServicesPage extends StatelessWidget {
  final String userName;
  final String profileImagePath;

  ServicesPage({
    this.userName = "Nomsa Mthembu",
    this.profileImagePath = 'assets/profile_placeholder.png',
  });

  @override
  Widget build(BuildContext context) {
    final services = [
      'Mobile Mammography',
      'Breast Health Consultation',
      'Pap Smear',
      'Bone Density Scan',
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Available Services')),
      drawer: AppDrawer(
        userName: userName,
        profileImagePath: profileImagePath,
      ),
      body: Column(
        children: [
          AppHeader(
            userName: userName,
            profileImagePath: profileImagePath,
            onProfileTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(services[index]),
                    trailing: ElevatedButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Schedule Service'),
                          content: Text('Location/date/time selection coming soon.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      ),
                      child: Text('Schedule Now'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
