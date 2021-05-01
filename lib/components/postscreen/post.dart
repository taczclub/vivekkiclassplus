import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../services/saveimage.dart';
import '../../services/shareimage.dart';
import '../../services/base_url.dart';

class Post extends StatelessWidget {
  final data, shareOnWhatsapp;
  const Post({@required this.data, @required this.shareOnWhatsapp});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        // decoration: BoxDecoration(
        //   color: Color(0xFFF9F9F9),
        //   boxShadow: [
        //     new BoxShadow(
        //       color: Colors.black54,
        //       blurRadius: 10,
        //       spreadRadius: 0.1,
        //       // offset: Offset(0, 0),
        //     ),
        //   ],
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/vivek.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'Dr. Vivek',
                              style: TextStyle(
                                color: Color(0xFF434343),
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Icon(
                                Icons.done,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 3,
                              left: 12,
                              right: 5,
                            ),
                            child: Icon(
                              Icons.public,
                              color: Color(0xFF6F6F6F),
                              size: 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              data['created_at'],
                              style: TextStyle(
                                color: Color(0xFF3F3F3F),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(data['text']),
            ),
            CachedNetworkImage(
              imageUrl: '$baseURL/dist/post/' + data['image'],
              width: double.infinity,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Center(
                  child: Container(
                    height: 200,
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Row(
                  //   children: [
                  //     // Icon(
                  //     //   Icons.favorite_outline,
                  //     //   color: Colors.red,
                  //     // ),
                  //     Icon(
                  //       Icons.favorite,
                  //       color: Colors.red,
                  //     ),
                  //     Container(
                  //       padding: const EdgeInsets.symmetric(horizontal: 3),
                  //       child: Text('23,000'),
                  //     )
                  //   ],
                  // ),
                  InkWell(
                    onTap: () async {
                      bool res = await saveImage(data['image'],
                          '$baseURL/dist/post/' + data['image'], context);
                      if (res) {
                        shareOnWhatsapp(data['image'], data['text']);
                      }
                    },
                    child: Image.asset(
                      'assets/icons/whatsapp.png',
                      height: 25,
                      width: 25,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      shareImage(data['image'], data['text'],
                          '$baseURL/dist/post/' + data['image'], context);
                    },
                    child: Icon(
                      Icons.share,
                      color: Colors.cyan[500],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      saveImage(data['image'],
                          '$baseURL/dist/post/' + data['image'], context);
                    },
                    child: Icon(
                      Icons.file_download,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
