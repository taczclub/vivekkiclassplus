import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vivekkiclassplus/screens/NetjrfTestPlayScreen.dart';
import 'package:vivekkiclassplus/screens/model.dart';
import 'package:vivekkiclassplus/services/netjrftest.dart';

class NetjrfTestScreen extends StatefulWidget {
  final String id;
  NetjrfTestScreen({@required this.id});

  @override
  _NetjrfTestScreenState createState() => _NetjrfTestScreenState();
}

class _NetjrfTestScreenState extends State<NetjrfTestScreen> {
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
        future: getNetjrfTest(widget.id),
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
                return NetjrfTestPlayScreen(
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
