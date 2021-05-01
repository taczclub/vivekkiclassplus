import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/plans.dart';
import '../components/planscreen.dart/plan.dart';

class PlansScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Plans',
          style: GoogleFonts.ptSerif(fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
        future: getPlans(),
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
                return snapshot.data['msg'].length != 0
                    ? ListView.builder(
                        itemCount: snapshot.data['msg'].length,
                        itemBuilder: (context, index) {
                          return Plan(
                            activeDate: snapshot.data['msg'][index]
                                ['active_date'],
                            expiredDate: snapshot.data['msg'][index]
                                ['expired_date'],
                            months: snapshot.data['msg'][index]['months'],
                            amount: snapshot.data['msg'][index]['amount'],
                            expired: snapshot.data['msg'][index]['expired'],
                          );
                        },
                      )
                    : Center(child: Text('No Active Plan'));
              }
          }
        },
      ),
    );
  }
}
