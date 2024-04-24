// ignore_for_file: use_super_parameters

import 'package:advice_app/screens/input_page.dart';
// import 'package:advice_app/screens/profile_page';
import 'package:advice_app/screens/user_profile.dart';
import 'package:advice_app/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Advice> adviceItems = [
    Advice(
      text: 'Follow your dreams!',
      author: 'John Doe',
      date: DateTime.now(),
    ),
    Advice(
      text: 'Stay focused and never give up.',
      author: 'Jane Smith',
      date: DateTime.now(),
    ),
    // Add more advice items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor2,
        title: const Text(
          'Talo Wadaag',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: primaryColor3,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: primaryColor3,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // CircleAvatar(backgroundColor: primaryColor3),
                  Text(
                    'Menu',
                    style: TextStyle(
                      color: primaryColor3,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_2_rounded),
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserProfileScreen()),
                );
              },
            ),
            // Add more list tiles for other sections of the app
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate back to the login screen
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: AdviceList(adviceItems: adviceItems),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor2,
        onPressed: () {
          // Navigate to the screen where users can input their advice
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InputPage()),
          );
        },
        child: const Icon(
          Icons.add,
          color: primaryColor3,
        ),
      ),
    );
  }
}

class AdviceList extends StatelessWidget {
  final List<Advice> adviceItems;

  const AdviceList({Key? key, required this.adviceItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: adviceItems.length,
      itemBuilder: (context, index) {
        return AdviceCard(advice: adviceItems[index]);
      },
    );
  }
}

class Advice {
  final String text;
  final String author;
  final DateTime date;

  Advice({required this.text, required this.author, required this.date});
}

class AdviceCard extends StatelessWidget {
  final Advice advice;

  const AdviceCard({super.key, required this.advice});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(advice.text),
        subtitle: Text('${advice.author} - ${_formatDate(advice.date)}'),
      ),
    );
  }

  String _formatDate(DateTime date) {
    // You can format the date as per your preference
    return '${date.day}/${date.month}/${date.year}';
  }
}
