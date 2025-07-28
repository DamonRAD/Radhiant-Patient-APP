import 'dart:io';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String userName;
  final String profileImagePath;

  const AppDrawer({
    Key? key,
    required this.userName,
    required this.profileImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF013C5A), Color(0xFF02A676)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            accountName: Text(userName, style: const TextStyle(fontSize: 18)),
            accountEmail: const Text("Patient"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: profileImagePath.isNotEmpty && File(profileImagePath).existsSync()
                  ? FileImage(File(profileImagePath))
                  : const AssetImage('assets/profile_placeholder.png') as ImageProvider,
            ),
          ),
          _buildNavItem(context, Icons.home, "Home", '/home'),
          _buildNavItem(context, Icons.calendar_today, "My Services", '/services'),
          _buildNavItem(context, Icons.description, "Reports", '/reports'),
          _buildNavItem(context, Icons.info_outline, "Info", '/info'),
          _buildNavItem(context, Icons.person, "Profile", '/profile'),
        ],
      ),
    );
  }

  ListTile _buildNavItem(BuildContext context, IconData icon, String label, String routeName) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        Navigator.pop(context);
        if (ModalRoute.of(context)?.settings.name != routeName) {
          Future.delayed(const Duration(milliseconds: 150), () {
            Navigator.pushReplacementNamed(context, routeName);
          });
        }
      },
    );
  }
}
