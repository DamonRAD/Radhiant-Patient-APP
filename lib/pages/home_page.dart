import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String userName = "Nomsa Mthembu"; // Placeholder for dynamic name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                if (ModalRoute.of(context)?.settings.name != '/home') {
                  Navigator.pop(context);
                  Future.delayed(Duration(milliseconds: 150), () {
                    Navigator.pushReplacementNamed(context, '/home');
                  });
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text("My Services"),
              onTap: () {
                if (ModalRoute.of(context)?.settings.name != '/services') {
                  Navigator.pop(context);
                  Future.delayed(Duration(milliseconds: 150), () {
                    Navigator.pushReplacementNamed(context, '/services');
                  });
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text("Reports"),
              onTap: () {
                if (ModalRoute.of(context)?.settings.name != '/reports') {
                  Navigator.pop(context);
                  Future.delayed(Duration(milliseconds: 150), () {
                    Navigator.pushReplacementNamed(context, '/reports');
                  });
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("Info"),
              onTap: () {
                if (ModalRoute.of(context)?.settings.name != '/info') {
                  Navigator.pop(context);
                  Future.delayed(Duration(milliseconds: 150), () {
                    Navigator.pushReplacementNamed(context, '/info');
                  });
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                if (ModalRoute.of(context)?.settings.name != '/profile') {
                  Navigator.pop(context);
                  Future.delayed(Duration(milliseconds: 150), () {
                    Navigator.pushReplacementNamed(context, '/profile');
                  });
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal.shade700, Colors.green.shade500],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Builder(
                      builder: (context) => IconButton(
                        icon: Icon(Icons.menu, color: Colors.white),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/sis.png',
                      height: 40,
                      errorBuilder: (_, __, ___) => Icon(Icons.image, color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            // Profile Picture
            Transform.translate(
              offset: Offset(0, -24),
              child: CircleAvatar(
                radius: 36,
                backgroundImage: AssetImage("asset/profile_placeholder.png"),
                backgroundColor: Colors.white,
              ),
            ),

            SizedBox(height: 16),

            // Main Content
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green),
                        SizedBox(width: 8),
                        Expanded(child: Text("Well done! Your profile is 100% complete.")),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),

                  sectionHeader("Reports", onTap: () {}),
                  placeholderCard("Medical Report Preview"),
                  SizedBox(height: 24),

                  sectionHeader("Services", onTap: () {
                    Navigator.pushNamed(context, '/services');
                  }),
                  placeholderCard("Location-Filtered Services"),
                  SizedBox(height: 24),

                  sectionHeader("Upcoming Events", onTap: () {}),
                  placeholderCard("Events Filtered by Location"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionHeader(String title, {required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(foregroundColor: Colors.teal),
          child: Text("View All >"),
        ),
      ],
    );
  }

  Widget placeholderCard(String text) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: Text(text)),
    );
  }
}
