import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivekkiclassplus/services/sociologytests.dart';
import '../services/base_url.dart';

class SociologyTestsScreen extends StatelessWidget {
  final String id;
  SociologyTestsScreen({@required this.id});
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tests',
          style: GoogleFonts.ptSerif(fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
        future: getSociologyTests(id),
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
                return ListView.builder(
                  itemCount: snapshot.data['msg'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed('sociology_test', arguments: {
                        'id': snapshot.data['msg'][index]['_id']
                      }),
                      child: Card(
                        child: ListTile(
                          leading: Image.asset(
                            'assets/icons/play-button.png',
                            height: 40,
                            width: 40,
                          ),
                          title: Text(
                            snapshot.data['msg'][index]['name'],
                            style: GoogleFonts.ptSerif(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
          }
        },
      ),
    );
  }
}
