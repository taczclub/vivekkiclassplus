import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/qstudents.dart';
import '../services/base_url.dart';

class QstudentScreen extends StatefulWidget {
  @override
  _QstudentScreenState createState() => _QstudentScreenState();
}

class _QstudentScreenState extends State<QstudentScreen> {
  var dataWidth;
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      setState(() {
        dataWidth = MediaQuery.of(context).size.width - 190;
      });
    } else {
      setState(() {
        dataWidth = MediaQuery.of(context).size.width - 190;
      });
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Qualified Students',
          style: GoogleFonts.ptSerif(fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
        future: getQstudents(),
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
                          return Card(
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: baseURL +
                                      '/dist/qstudents/${snapshot.data['msg'][index]['image']}',
                                  height: 152,
                                  width: 152,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: dataWidth,
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            'Name: ' +
                                                snapshot.data['msg'][index]
                                                    ['name'],
                                            style: GoogleFonts.ptSerif(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: dataWidth,
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            'Subject: ' +
                                                snapshot.data['msg'][index]
                                                    ['subject'],
                                            style: GoogleFonts.ptSerif(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: dataWidth,
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            'Exam: ' +
                                                snapshot.data['msg'][index]
                                                    ['qexam'],
                                            style: GoogleFonts.ptSerif(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: dataWidth,
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            'Roll Number: ' +
                                                snapshot.data['msg'][index]
                                                    ['roll_number'],
                                            style: GoogleFonts.ptSerif(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          'No Qualified Student',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
              }
          }
        },
      ),
    );
  }
}
