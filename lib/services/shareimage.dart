import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';

shareImage(filename, msg, url, context) async {
  var firstPath = '/storage/emulated/0' + '/Vivek Ki Class';
  var filePathAndName = '/storage/emulated/0' + '/Vivek Ki Class/' + filename;
  var exists = await File(filePathAndName).exists();
  if (exists) {
    if (await Permission.storage.request().isGranted) {
      await Share.shareFiles([filePathAndName], text: msg);
    } else {
      await Permission.storage.request();
    }
  } else {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Please Wait'),
        duration: Duration(microseconds: 500),
      ),
    );
    try {
      if (await Permission.storage.request().isGranted) {
        var response = await get(url);

        await Directory(firstPath).create(recursive: true); // <-- 1
        File file2 = new File(filePathAndName); // <-- 2
        file2.writeAsBytesSync(response.bodyBytes); // <-- 3
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Image saved to ' + filePathAndName),
          ),
        );
        await Share.shareFiles([filePathAndName], text: msg);
      } else {
        await Permission.storage.request();
      }
    } catch (e) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong please try again later'),
        ),
      );
    }
  }
}
