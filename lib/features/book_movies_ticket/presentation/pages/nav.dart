import 'package:book_my_movie/features/book_movies_ticket/presentation/pages/home_page.dart';
import 'package:book_my_movie/features/book_movies_ticket/presentation/pages/profile.dart';
import 'package:flutter/material.dart';

import '../music/musicplayer.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color of the screen
      body: Stack(
        children: [
          // Add your page content here. It will be laid out above the bottom padding.
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          // Bottom padding with transparent background.
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 20,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BottomAppBar(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    height: 60,

//  decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//           colors: [Colors.deepPurple, Colors.redAccent],
//         ),
//       ),

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.deepPurple, Colors.redAccent],
                      ),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 5,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildTabItem(icon: Icons.home, index: 0),
                        buildTabItem(icon: Icons.music_note, index: 1),
                        buildTabItem(icon: Icons.search, index: 2),
                        buildTabItem(icon: Icons.person, index: 3),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabItem({
    required IconData icon,
    required int index,
  }) {
    return IconButton(
      icon: Icon(
        icon,
        size: 30.0,
        color: _selectedIndex == index ? Colors.blue : Colors.grey.shade400,
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}

// Define your page widgets here:
final List<Widget> _widgetOptions = <Widget>[
  HomePage(),
 MusicPlayer(),
  Text('Search', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ProfileScreen(),
];
