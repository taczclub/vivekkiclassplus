import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/WebViewClass.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Contact Us', style: GoogleFonts.ptSerif(fontWeight: FontWeight.w600),),
      ),
      body: WebViewClass(url: '/contact'),
    );
  }
}
