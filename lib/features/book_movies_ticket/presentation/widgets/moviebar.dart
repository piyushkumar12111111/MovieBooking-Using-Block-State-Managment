import 'package:flutter/material.dart';

class MovieAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;

  const MovieAppBar({
    Key? key,
    this.title = 'Movie App',
    this.height = 56.0, // Default AppBar height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.deepPurple, Colors.redAccent],
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes shadow
        title: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              // Implement favorite movies functionality
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
