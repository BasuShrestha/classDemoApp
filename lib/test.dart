import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int _itemIndex = 0;
  final screens = [
    Center(
      child: Text(
        "Email",
        style: TextStyle(fontSize: 80),
      ),
    ),
    Center(
      child: Text(
        "Group",
        style: TextStyle(fontSize: 80),
      ),
    ),
    Center(
      child: Text(
        "Chat",
        style: TextStyle(fontSize: 80),
      ),
    ),
    Center(
      child: Text(
        "Profile",
        style: TextStyle(fontSize: 80),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_itemIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade300,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontSize: 15,
                fontWeight: FontWeight.w800),
          ),
        ),
        child: NavigationBar(
          height: 70,
          backgroundColor: Colors.amber.shade100,
          selectedIndex: _itemIndex,
          onDestinationSelected: (value) => setState(() {
            this._itemIndex = value;
          }),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.email_outlined), label: ""),
            NavigationDestination(icon: Icon(Icons.group_outlined), label: ""),
            NavigationDestination(
                icon: Icon(Icons.chat_bubble_outline_outlined), label: ""),
            NavigationDestination(
                icon: Icon(Icons.person_3_outlined), label: ""),
          ],
        ),
      ),
    );
  }
}
