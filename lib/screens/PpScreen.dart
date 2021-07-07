import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:vivekkiclassplus/services/ppvideocategory.dart';

class PpCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pre PHD Categories',
          style: GoogleFonts.ptSerif(fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('pp_videos_category');
            },
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/icons/play-button.png',
                  height: 40,
                  width: 40,
                ),
                title: Text(
                  'Videos',
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('pp_notes_category');
            },
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/icons/pdf.png',
                  height: 40,
                  width: 40,
                ),
                title: Text(
                  'Notes',
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('pp_tests_category');
            },
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/icons/pdf.png',
                  height: 40,
                  width: 40,
                ),
                title: Text(
                  'Test Series',
                  style: GoogleFonts.ptSerif(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
