import 'package:flutter/material.dart';
import '../screens/HomeScreen.dart';
import './MainDrawer.dart';
import '../screens/AuthScreen.dart';
import '../screens/PostScreen.dart';
import '../screens/AnnouncementScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNav extends StatefulWidget {
  final int index;
  BottomNav({this.index});
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex;
  List _children = [
    HomeScreen(),
    AnnouncementScreen(),
    PostScreen(),
    AuthScreen(),
  ];
  final appBarTitle = [
    'vivek ki class',
    'Announcement',
    'Posts',
  ];
  @override
  void initState() {
    widget.index != null ? _currentIndex = widget.index : _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Text(
          appBarTitle[_currentIndex],
          style: GoogleFonts.ptSerif(fontWeight: FontWeight.w600),
        ),
        // actions: [
        //   _currentIndex == 0
        //       ? Builder(
        //           builder: (context) {
        //             return IconButton(
        //               onPressed: () {
        //                 Scaffold.of(context).showSnackBar(
        //                   SnackBar(
        //                     content: Text('Comming Soon ...'),
        //                   ),
        //                 );
        //               },
        //               icon: Icon(Icons.search),
        //             );
        //           },
        //         )
        //       : Container()
        // ],
      ),
      drawer: _currentIndex != 3 ? MainDrawer() : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // showUnselectedLabels: false,
        onTap: onTabTapped,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.home,
              // color: primaryPink,
            ),
            title: new Text(
              'Home',
              style: GoogleFonts.ptSerif(),
              // style: TextStyle(color: primaryPink),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.campaign,
              // color: Colors.black,
            ),
            title: new Text(
              'Announcement',
              style: GoogleFonts.ptSerif(),
              // style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.post_add,
              // color: Colors.black,
            ),
            title: new Text(
              'Blog',
              style: GoogleFonts.ptSerif(),
              // style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
