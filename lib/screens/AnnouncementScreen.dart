import 'package:flutter/material.dart';
import '../components/WebViewClass.dart';

class AnnouncementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebViewClass(url: '/announcement');
  }
}
