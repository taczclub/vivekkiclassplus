import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vivekkiclassplus/screens/PpTestPlayScreen.dart';
import 'package:vivekkiclassplus/screens/model.dart';
import 'package:vivekkiclassplus/services/pptest.dart';

class PpTestScreen extends StatefulWidget {
  final String id;
  PpTestScreen({@required this.id});

  @override
  _PpTestScreenState createState() => _PpTestScreenState();
}

class _PpTestScreenState extends State<PpTestScreen> {
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
        future: getPpTest(widget.id),
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
                return PpTestPlayScreen(
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
