import 'package:flutter/material.dart';
import './route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      title: 'vivek ki class plus',
      theme: ThemeData(
        primaryColor: Color(0xff1f6b7a),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
