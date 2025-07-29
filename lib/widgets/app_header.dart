import 'package:flutter/material.dart';
import '../pages/profile_page.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final String profileImagePath;

  const AppHeader({
    Key? key,
    required this.profileImagePath,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(180);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: preferredSize.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0CA98E), Color(0xFF3BD6B1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        Positioned(
          top: 55,
          child: Image.asset(
            'assets/app_icon.PNG',
            height: 40,
          ),
        ),
        Positioned(
          top: 45,
          left: 16,
          child: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        Positioned(
          top: 45,
          right: 16,
          child: const Icon(Icons.notifications_none, color: Colors.white),
        ),
        Positioned(
          bottom: -50,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            child: Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300, width: 2),
              ),
              child: ClipOval(
                child: Image.asset(
                  profileImagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50), // To create space below
      ],
    );
  }
}
