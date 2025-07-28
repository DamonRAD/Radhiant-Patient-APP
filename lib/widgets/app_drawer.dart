import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}