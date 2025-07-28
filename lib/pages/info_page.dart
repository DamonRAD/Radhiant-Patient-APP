import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_header.dart';

class InfoPage extends StatelessWidget {
  final String userName;
  final String profileImagePath;

  InfoPage({
    this.userName = "Nomsa Mthembu",
    this.profileImagePath = 'assets/profile_placeholder.png',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Info")),
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
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Us", style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 8),
                  SelectableText("Email: info@radhiant.com"),
                  SelectableText("Phone: 080 000 1234"),
                  SelectableText("Address: 123 Health Lane, Eastern Cape"),
                  SizedBox(height: 16),

                  Text("Business Hours", style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 8),
                  Text("Mon–Fri: 8am–5pm"),
                  Text("Sat: 9am–1pm"),
                  SizedBox(height: 16),

                  Text("Website", style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: 8),
                  SelectableText("https://rdisa.co.za"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
