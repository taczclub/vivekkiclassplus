import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import '../components/mainscreen/slider.dart';
import '../services/auth.dart' show logout;
import '../services/share.dart';
import '../services/launchurl.dart';
import '../services/activeplan.dart';
import '../components/homescreen/PlanError.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loggedin = false;
  planError(type, context) async {
    showDialog(
      context: context,
      builder: (_) => PlanErrorWait(
        msg: 'Please Wait ...',
      ),
    );
    // var res = await getActivePlan();
    if (!loggedin) {
      Navigator.of(context).pop();
      String planerrormsg =
          'कोर्स परचेज करने के लिए अपना नाम और सब्जेक्ट लिखकर इस नंबर पर व्हाट्सएप करें-9983601411 अथवा कॉल करें-8690015710';
      showDialog(
        context: context,
        builder: (_) => PlanError(
          msg: planerrormsg,
          height: 270,
        ),
      );
    } else {
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(type + '_category');
    }
    // Navigator.of(context).pushNamed(type + '_category');
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.getString('token') != null ? loggedin = true : loggedin = false;
    });
  }

  confirmDialog(setS, context) {
    final size = MediaQuery.of(context).size;
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
              height: size.width - 150,
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
                    style: GoogleFonts.ptSerif(
                      fontSize: 21,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Do you really want to logout',
                    style: GoogleFonts.ptSerif(
                      fontSize: 17,
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
                            style: GoogleFonts.ptSerif(color: Colors.white),
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
                            style: GoogleFonts.ptSerif(color: Colors.white),
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
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return ListView(
      children: [
        Container(
          height: 25,
          // decoration: BoxDecoration(
          //   border: Border.symmetric(
          //     horizontal: BorderSide(color: Colors.grey),
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Marquee(
              text: 'Mohra Group of education welcomes you',
              velocity: 40,
              blankSpace: 20,
              style: GoogleFonts.ptSerif(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        MainSlider(),
        GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isPortrait ? 3 : 4,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
          ),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(5),
          children: [
            InkWell(
              onTap: () async => await planError('netjrf', context),
              child: gridItem(
                true,
                Image.asset(
                  'assets/icons/sociology.png',
                  height: 48,
                  width: 48,
                ),
                Text(
                  'NET/JRF Classes',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // InkWell(
            //   onTap: () async => await planError('videos', context),
            //   child: gridItem(
            //     true,
            //     Image.asset(
            //       'assets/icons/play-button.png',
            //       height: 50,
            //       width: 50,
            //     ),
            //     Text(
            //       'Video Classes (NET/JRF)',
            //       textAlign: TextAlign.center,
            //       style: GoogleFonts.ptSerif(
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () async => await planError('notes', context),
            //   child: gridItem(
            //     true,
            //     Image.asset(
            //       'assets/icons/pdf.png',
            //       height: 46,
            //       width: 46,
            //     ),
            //     Text(
            //       'Notes & PDF (NET/JRF)',
            //       textAlign: TextAlign.center,
            //       style: GoogleFonts.ptSerif(
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.of(context).pushNamed('profile_screen'),
            //   child: gridItem(
            //     false,
            //     Image.asset(
            //       'assets/icons/profile.png',
            //       height: 50,
            //       width: 50,
            //     ),
            //     Text(
            //       'Profile',
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         fontWeight: FontWeight.w500,
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.of(context).pushNamed('plans_screen'),
            //   child: gridItem(
            //     false,
            //     Image.asset(
            //       'assets/icons/to-do-list.png',
            //       height: 52,
            //       width: 52,
            //     ),
            //     Text(
            //       'My Plans',
            //       textAlign: TextAlign.center,
            //       style: GoogleFonts.ptSerif(
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ),
            // ),
            InkWell(
              onTap: () async => await planError('sociology', context),
              child: gridItem(
                true,
                Image.asset(
                  'assets/icons/sociology.png',
                  height: 48,
                  width: 48,
                ),
                Text(
                  'Sociology Classes',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async => await planError('pp', context),
              child: gridItem(
                true,
                Image.asset(
                  'assets/icons/sociology.png',
                  height: 48,
                  width: 48,
                ),
                Text(
                  'Pre PHD Classes',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'current_affair_screen');
              },
              child: gridItem(
                false,
                Image.asset(
                  'assets/icons/current-affair.png',
                  height: 42,
                  width: 42,
                ),
                Text(
                  'Current Affairs',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => launchURL('whatsapp://send?phone=+919983601411'),
              child: gridItem(
                false,
                Image.asset(
                  'assets/icons/whatsapp.png',
                  height: 47,
                  width: 47,
                ),
                Text(
                  'Chat On Whatsapp',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => launchURL('tel:+918690015710'),
              child: gridItem(
                false,
                Image.asset(
                  'assets/icons/call-center.png',
                  height: 45,
                  width: 45,
                ),
                Text(
                  'Direct Call\nWith Us',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('qstudent_screen'),
              child: gridItem(
                false,
                Image.asset(
                  'assets/icons/qstudent.png',
                  height: 44,
                  width: 44,
                ),
                Text(
                  'Qualified Students',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => launchURL(
                  'https://www.youtube.com/channel/UCVqgTFeGeoMIXNZHhJQZ5Lg'),
              child: gridItem(
                false,
                Image.asset(
                  'assets/icons/youtube.png',
                  height: 46,
                  width: 46,
                ),
                Text(
                  'YouTube Channel',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => share(),
              child: gridItem(
                false,
                Image.asset(
                  'assets/icons/group.png',
                  height: 47,
                  width: 47,
                ),
                Text(
                  'Refer a Friend',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => launchURL(
                  'https://play.google.com/store/apps/details?id=com.taczclub.vivekkiclassplus'),
              child: gridItem(
                false,
                Image.asset(
                  'assets/icons/playstore.png',
                  height: 45,
                  width: 45,
                ),
                Text(
                  'Rate this App',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // InkWell(
            //   onTap: () => Navigator.of(context).pushNamed('help_screen'),
            //   child: gridItem(
            //     false,
            //     Image.asset(
            //       'assets/icons/help.png',
            //       height: 48,
            //       width: 48,
            //     ),
            //     Text(
            //       'Email to Us',
            //       textAlign: TextAlign.center,
            //       style: GoogleFonts.ptSerif(
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ),
            // ),
            // InkWell(
            //   onTap: () => Navigator.of(context).pushNamed('contact_screen'),
            //   child: gridItem(
            //     false,
            //     Image.asset(
            //       'assets/icons/contact.png',
            //       height: 50,
            //       width: 50,
            //     ),
            //     Text(
            //       'Contact Us',
            //       textAlign: TextAlign.center,
            //       style: GoogleFonts.ptSerif(
            //         fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //   ),
            // ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamed('about_screen'),
              child: gridItem(
                false,
                Image.asset(
                  'assets/icons/about-us.png',
                  height: 47,
                  width: 47,
                ),
                Text(
                  'About Us',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            loggedin
                ? InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => confirmDialog(setState, context),
                      );
                    },
                    child: gridItem(
                      false,
                      Image.asset(
                        'assets/icons/logout.png',
                        height: 47,
                        width: 47,
                      ),
                      Text(
                        'Logout',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ptSerif(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }
}

Widget gridItem(lock, icon, title) {
  return Card(
    elevation: 3,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Stack(
      children: [
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: icon,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: title,
              ),
            ],
          ),
        ),
        lock
            ? Positioned(
                top: 5,
                right: 5,
                child: Icon(Icons.lock_outline),
              )
            : Container(),
      ],
    ),
  );
}

// getImei() async {
//   // await Permission.phone.request();
//   String imei =
//       await ImeiPlugin.getImei(shouldShowRequestPermissionRationale: false);
//   List<String> multiImei =
//       await ImeiPlugin.getImeiMulti(); //for double-triple SIM phones
//   String uuid = await ImeiPlugin.getId();
//   print(imei);
//   print(multiImei);
//   print(uuid);
// }
