import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About Me',
          style: GoogleFonts.ptSerif(fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/vivekkiclass.png',
                  height: 70,
                ),
                SizedBox(
                  height: 23,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.grey[700],
                        height: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'About Us',
                        style: GoogleFonts.ptSerif(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.grey[700],
                        height: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 23,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Who is Dr.Vivek Pragpura -',
                      // textAlign: TextAlign.center,
                      style: GoogleFonts.ptSerif(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '(1) - Ph.D. in sociology\n(2) - M.phil. in sociology\n(3) - MA (sociology)\n(4) - M.A. (history)\n(5) - master in social work (MSW)\n(6) - PG diploma labour law industrial relation and personal management (PGDLL)\n(7) - PG diploma in carrier and guidance\n(8) - RSCIT VMOU Kota\n(9) - RPSC SLET ( state topper in subject)\n(10) - UGC NET qualified in 7 time\n(11) - Selected in national fellowship for higher education (ministry of tribal affairs)\n(12) - Bachelor of Education (B.ed.)\n(13) - Bachelor of Arts (B.A.)',
                      // textAlign: TextAlign.center,
                      style: GoogleFonts.ptSerif(
                          color: Colors.grey[600], fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 23,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.grey[700],
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Our Goal',
                        style: GoogleFonts.ptSerif(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.grey[700],
                        height: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/admission-notification.png',
                  height: 200,
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      '2019 Copyright @ Vivek Ki Class',
                      style: GoogleFonts.ptSerif(
                          fontWeight: FontWeight.bold, color: Colors.grey[700]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
