import 'package:flutter/material.dart';
import '../services/share.dart';
import '../services/launchurl.dart';
import '../services/auth.dart' show logout;
import 'package:google_fonts/google_fonts.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  confirmDialog() {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: SizedBox(
              height: 220,
              width: 220,
              child: Column(
                children: [
                  Icon(
                    Icons.error_outline_sharp,
                    size: 80,
                    color: Colors.amber,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Do you really want to logout',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RaisedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          color: Colors.redAccent,
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.ptSerif(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                            logout();
                            Navigator.of(context).pushReplacementNamed('/');
                          },
                          color: Colors.green,
                          child: Text(
                            'Logout',
                            style: GoogleFonts.ptSerif(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              // SafeArea(
              //   child: Padding(
              //     padding: const EdgeInsets.all(12),
              //     child: Center(
              //       child: CircleAvatar(
              //         radius: 80,
              //         backgroundColor: Colors.white,
              //         child: Image.asset('assets/icons/boyprofile.png'),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 10),
              //   child: Center(
              //     child: Text(
              //       'Bittu Mahawar',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 20,
              //       ),
              //     ),
              //   ),
              // ),
              // Divider(
              //   color: Color(0xFF2ea1b8),
              // ),
              Expanded(
                child: SafeArea(
                  child: ListView(
                    padding: EdgeInsets.only(top: 0),
                    children: [
                      ListTile(
                        title: Center(
                          child: Text(
                            'vivek ki class',
                            style: GoogleFonts.ptSerif(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      InkWell(
                        onTap: () => {
                          Navigator.of(context).pop(),
                          Navigator.of(context).pushReplacementNamed('/')
                        },
                        child: ListTile(
                          leading: Image.asset(
                            'assets/icons/home.png',
                            height: 25,
                            width: 25,
                          ),
                          title: Text(
                            'Home',
                            style: GoogleFonts.ptSerif(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () =>
                      //       Navigator.of(context).pushNamed('profile_screen'),
                      //   child: ListTile(
                      //     leading: Image.asset(
                      //       'assets/icons/profile.png',
                      //       height: 25,
                      //       width: 25,
                      //     ),
                      //     title: Text(
                      //       'Profile',
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   ),
                      // ),
                      InkWell(
                        onTap: () => {
                          Navigator.of(context).pop(),
                          Navigator.of(context).pushNamed('plans_screen')
                        },
                        child: ListTile(
                          leading: Container(
                            child: Image.asset(
                              'assets/icons/to-do-list.png',
                              height: 25,
                              width: 25,
                            ),
                          ),
                          title: Text(
                            'My Plans',
                            style: GoogleFonts.ptSerif(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => {
                          Navigator.of(context).pop(),
                          launchURL('tel:+918690015710'),
                        },
                        child: ListTile(
                          leading: Container(
                            child: Image.asset(
                              'assets/icons/call-center.png',
                              height: 25,
                              width: 25,
                            ),
                          ),
                          title: Text(
                            'Direct Call With Us',
                            style: GoogleFonts.ptSerif(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () =>
                            launchURL('whatsapp://send?phone=+919983601411'),
                        child: ListTile(
                          leading: Image.asset(
                            'assets/icons/whatsapp.png',
                            height: 25,
                            width: 25,
                          ),
                          title: Text(
                            'Chat On Whatsapp',
                            style: GoogleFonts.ptSerif(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => {Navigator.of(context).pop(), share()},
                        child: ListTile(
                          leading: Image.asset(
                            'assets/icons/group.png',
                            height: 25,
                            width: 25,
                          ),
                          title: Text(
                            'Refer a friend',
                            style: GoogleFonts.ptSerif(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => {
                          Navigator.of(context).pop(),
                          Navigator.of(context).pushNamed('help_screen')
                        },
                        child: ListTile(
                          leading: Image.asset(
                            'assets/icons/help.png',
                            height: 25,
                            width: 25,
                          ),
                          title: Text(
                            'Email to Us',
                            style: GoogleFonts.ptSerif(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => {
                          Navigator.of(context).pop(),
                          launchURL(
                              'https://play.google.com/store/apps/details?id=com.taczclub.vivekkiclassplus'),
                        },
                        child: ListTile(
                          leading: Image.asset(
                            'assets/icons/playstore.png',
                            height: 25,
                            width: 25,
                          ),
                          title: Text(
                            'Rate This App',
                            style: GoogleFonts.ptSerif(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => {
                          Navigator.of(context).pop(),
                          launchURL(
                              'https://www.youtube.com/channel/UCVqgTFeGeoMIXNZHhJQZ5Lg')
                        },
                        child: ListTile(
                          leading: Image.asset(
                            'assets/icons/youtube.png',
                            height: 25,
                            width: 25,
                          ),
                          title: Text(
                            'Youtube Channel',
                            style: GoogleFonts.ptSerif(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => {
                          Navigator.of(context).pop(),
                          Navigator.of(context).pushNamed('contact_screen')
                        },
                        child: ListTile(
                          leading: Image.asset(
                            'assets/icons/contact.png',
                            height: 25,
                            width: 25,
                          ),
                          title: Text(
                            'Contact Us',
                            style: GoogleFonts.ptSerif(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => {
                          Navigator.of(context).pop(),
                          Navigator.of(context).pushNamed('about_screen')
                        },
                        child: ListTile(
                          leading: Image.asset(
                            'assets/icons/about-us.png',
                            height: 25,
                            width: 25,
                          ),
                          title: Text(
                            'About Us',
                            style: GoogleFonts.ptSerif(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      ListTile(
                        title: Text(
                          'App design and developed by TaCZclub pvt. ltd.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ptSerif(
                            color: Colors.white70,
                            // fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () => launchURL('https://taczclub.com'),
                      //   child: ListTile(
                      //     leading: Icon(
                      //       Icons.language,
                      //       color: Colors.tealAccent,
                      //     ),
                      //     title: Text(
                      //       'Visit TaCZclub',
                      //       style: GoogleFonts.ptSerif(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 15,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     showDialog(
                      //       context: context,
                      //       builder: (_) => confirmDialog(),
                      //     );
                      //   },
                      //   child: ListTile(
                      //     leading: Image.asset(
                      //       'assets/icons/logout.png',
                      //       height: 25,
                      //       width: 25,
                      //     ),
                      //     title: Text(
                      //       'Logout',
                      //       style: GoogleFonts.ptSerif(
                      //   color: Colors.white,
                      //   fontWeight: FontWeight.w600,
                      //   fontSize: 15,
                      // ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
