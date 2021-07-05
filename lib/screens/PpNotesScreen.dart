import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/ppnotes.dart';
import '../services/base_url.dart';

class PpNotesScreen extends StatelessWidget {
  final String id;
  PpNotesScreen({@required this.id});
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Pp Notes',
          style: GoogleFonts.ptSerif(fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
        future: getPpNotes(id),
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
                return GridView.builder(
                  itemCount: snapshot.data['msg'].length,
                  padding: EdgeInsets.all(5),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 2 : 3),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed('pp_note_view', arguments: {
                        'title': snapshot.data['msg'][index]['title'],
                        'pdf': snapshot.data['msg'][index]['basename']
                      }),
                      child: Card(
                        child: Column(
                          children: [
                            Expanded(
                              child: CachedNetworkImage(
                                imageUrl: '$baseURL/dist/thumbnail/pp/' +
                                    snapshot.data['msg'][index]['thumbnail'],
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  (index + 1).toString() +
                                      '. ' +
                                      snapshot.data['msg'][index]['title'],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ],
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
