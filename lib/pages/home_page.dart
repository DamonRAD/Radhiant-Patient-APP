import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_header.dart';

class HomePage extends StatefulWidget {
  final String userName;

  const HomePage({super.key, this.userName = "Nomsa Mthembu"});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showBanner = true;

  String name = "Nomsa";
  String email = "nomsa@example.com";
  String phone = "0812345678";
  String id = "123456789";
  String address = "123 Main Street";

  @override
  void initState() {
    super.initState();
    _checkBannerStatus();
  }

  Future<void> _checkBannerStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final wasDismissed = prefs.getBool('bannerDismissed') ?? false;

    final percentage = _calculateProfileCompletion();
    if (percentage == 100 && wasDismissed) {
      setState(() => showBanner = false);
    } else if (percentage < 100) {
      prefs.setBool('bannerDismissed', false);
      setState(() => showBanner = true);
    }
  }

  int _calculateProfileCompletion() {
    int filled = [name, email, phone, id, address].where((f) => f.isNotEmpty).length;
    return ((filled / 5) * 100).round();
  }

  Future<void> _dismissBanner() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('bannerDismissed', true);
    setState(() => showBanner = false);
  }

  @override
  Widget build(BuildContext context) {
    final completion = _calculateProfileCompletion();

    return Scaffold(
      drawer: AppDrawer(
        userName: widget.userName,
        profileImagePath: 'assets/profile_placeholder.png',
      ),
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(
              profileImagePath: 'assets/profile_placeholder.png',
            ),
            if (showBanner && completion < 100)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: MaterialBanner(
                  backgroundColor: Colors.teal.shade50,
                  content: Text("Your profile is $completion% complete."),
                  leading: const Icon(Icons.info_outline, color: Colors.teal),
                  actions: [
                    TextButton(
                      onPressed: _dismissBanner,
                      child: const Text("DISMISS"),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  sectionHeader("Reports", onTap: () {
                    Navigator.pushNamed(context, '/reports');
                  }),
                  modernCard("Medical Report Preview"),
                  const SizedBox(height: 24),
                  sectionHeader("Services", onTap: () {
                    Navigator.pushNamed(context, '/services');
                  }),
                  modernCard("Location-Filtered Services"),
                  const SizedBox(height: 24),
                  sectionHeader("Upcoming Events", onTap: () {
                    Navigator.pushNamed(context, '/events');
                  }),
                  modernCard("Events Filtered by Location"),
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
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        TextButton(
          onPressed: onTap,
          child: const Text("View All >"),
        ),
      ],
    );
  }

  Widget modernCard(String text) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          children: [
            const Icon(Icons.folder_open, color: Colors.teal),
            const SizedBox(width: 16),
            Expanded(
              child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
      ),
    );
  }
}
