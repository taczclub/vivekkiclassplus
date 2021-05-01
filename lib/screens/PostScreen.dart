import 'package:flutter/material.dart';
import '../services/post.dart';
import '../components/postscreen/post_main.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPosts(),
      builder: (BuildContext context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Something went wrong please try again later',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else {
              if (snapshot.data['error']) {
                return Center(
                  child: Text(
                    'Something went wrong please try again later',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              } else {
                return PostMain(data: snapshot.data['data']);
              }
            }
        }
      },
    );
  }
}
