import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './post.dart';

class PostMain extends StatelessWidget {
  final data;
  const PostMain({@required this.data});

  void shareOnWhatsapp(image, msg) async {
    String path = '/storage/emulated/0/Vivek Ki Class/' + image;
    var methodChannel = MethodChannel('com.taczclub.vivekkiclassplus');
    await methodChannel
        .invokeMethod('shareOnWhatsapp', {"path": path, "msg": msg});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Post(
          data: data[index],
          shareOnWhatsapp: shareOnWhatsapp,
        );
      },
    );
  }
}
