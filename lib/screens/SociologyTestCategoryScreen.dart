import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivekkiclassplus/services/sociologytestcategory.dart';

class SociologyTestCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sociology Test Categories',
          style: GoogleFonts.ptSerif(fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
        future: getSociologyTestCategory(),
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
                  itemBuilder: (context, index) {
                    return snapshot.data['msg'].length != 0
                        ? InkWell(
                            onTap: () => {
                              Navigator.of(context).pushNamed(
                                snapshot.data['msg'][index]['subcategory']
                                    ? 'sociology_tests_sub_category'
                                    : 'sociology_tests',
                                arguments: snapshot.data['msg'][index]['_id'],
                              )
                            },
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
                          )
                        : Center(child: Text('No Test Category'));
                  },
                );
              }
          }
        },
      ),
    );
  }
}
