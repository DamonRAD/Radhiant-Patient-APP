import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Info")),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
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
    );
  }
}
