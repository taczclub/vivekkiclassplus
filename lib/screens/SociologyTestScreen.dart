import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vivekkiclassplus/screens/SociologyTestPlayScreen.dart';
import 'package:vivekkiclassplus/screens/model.dart';
import 'package:vivekkiclassplus/services/sociologytest.dart';

class SociologyTestScreen extends StatefulWidget {
  final String id;
  SociologyTestScreen({@required this.id});

  @override
  _SociologyTestScreenState createState() => _SociologyTestScreenState();
}

class _SociologyTestScreenState extends State<SociologyTestScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getSociologyTest(widget.id),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.data['error']) {
                return Center(
                  child: Text(
                    snapshot.data['msg'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              } else {
                return SociologyTestPlayScreen(
                  questions: snapshot.data['msg']['questions'],
                  duration: snapshot.data['msg']['duration'],
                );
              }
          }
        },
      ),
    );
  }
}
