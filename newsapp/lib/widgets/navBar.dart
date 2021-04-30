import 'package:flutter/material.dart';
import 'package:newsapp/ui/favourites.dart';
import 'package:newsapp/ui/home.dart';
import 'package:newsapp/ui/profile.dart';

class NavBar extends StatefulWidget {
  @override
  NavState createState() => NavState();
}

class NavState extends State<NavBar> {
  int selectedIndex = 0;

  List<Widget> options = <Widget>[
    Home(),
    Favourite(),
    Profile(),
  ];

  void onTapItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: options.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onTapItem,
      ),
    );
  }
}
