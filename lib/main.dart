import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout_app/home.dart';
import 'package:layout_app/profile.dart';
import 'package:layout_app/shop.dart';
import 'package:layout_app/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int _currentPageIndex = 0;
  List<Widget> screens = [HomePage(), ShopPage(), ProfilePage(), TestPage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/shop': (context) => ShopPage(),
        '/profile': (context) => ProfilePage(),
      },
      home: Scaffold(
        drawer: const Drawer(
          backgroundColor: Colors.blueAccent,
          child: SafeArea(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/UserProfile.png'),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                  subtitle: Text("Go to profile"),
                  trailing: Icon(Icons.arrow_back_rounded),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "An AppBar",
            style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              color: Colors.white,
            ),
          ),
        ),
        body: screens[_currentPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: (value) {
            setState(() {
              _currentPageIndex = value;
            });
          },
          // onTap: (value) {
          //   Navigator.pushNamed(context, '/home');
          // },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
