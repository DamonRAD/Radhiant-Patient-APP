import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class ReportsPage extends StatefulWidget {
  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  final List<String> steps = [
    "Appointment",
    "Images Sent",
    "Review",
    "Complete",
  ];

  final int completedIndex = 3;
  String selectedYear = "2025"; // Add this variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mammogram Reports")),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: selectedYear,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedYear = value;
                  });
                }
              },
              items: ["2025", "2024", "2023"]
                  .map((year) => DropdownMenuItem(
                        value: year,
                        child: Text(year),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            Stepper(
              currentStep: completedIndex,
              physics: NeverScrollableScrollPhysics(),
              steps: steps
                  .map((step) => Step(
                        title: Text(step),
                        content: SizedBox.shrink(),
                        isActive: steps.indexOf(step) <= completedIndex,
                      ))
                  .toList(),
              controlsBuilder: (_, __) => SizedBox.shrink(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ReportDetailPage()),
                );
              },
              child: Text("View Report"),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report Details")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ListTile(title: Text("Patient Name"), subtitle: Text("Jane Doe")),
            ListTile(title: Text("Appointment Date"), subtitle: Text("2025-07-12")),
            ListTile(title: Text("Status"), subtitle: Text("Complete")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Download PDF"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Send to Email"),
            ),
          ],
        ),
      ),
    );
  }
}
