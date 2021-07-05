import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivekkiclassplus/services/netjrftestcategory.dart';

class NetjrfTestCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Netjrf Test Categories',
          style: GoogleFonts.ptSerif(fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
        future: getNetjrfTestCategory(),
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
                                    ? 'netjrf_tests_sub_category'
                                    : 'netjrf_test_player',
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
