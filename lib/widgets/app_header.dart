import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String userName;
  final String profileImagePath; // asset path or network url
  final VoidCallback? onProfileTap;

  const AppHeader({
    Key? key,
    required this.userName,
    required this.profileImagePath,
    this.onProfileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        children: [
          GestureDetector(
            onTap: onProfileTap,
            child: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(profileImagePath),
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              "Hello, $userName",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}