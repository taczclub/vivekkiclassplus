import 'package:flutter/material.dart';
import './LoginScreen.dart';
import './ProfileScreen.dart';
import '../services/auth.dart' show tryLocalLogin;

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  refreshAuth() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: tryLocalLogin(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.data) {
              return ProfileScreen();
            } else {
              return LoginScreen(
                // refresh: refreshAuth,
              );
            }
        }
      },
    );
  }
}
