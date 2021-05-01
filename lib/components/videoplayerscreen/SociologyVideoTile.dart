import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../services/base_url.dart';

class SociologyVideoTile extends StatelessWidget {
  final String img;
  final String title;
  final bool active;
  SociologyVideoTile(
      {@required this.img, @required this.title, @required this.active});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: this.active ? Colors.amber[50] : Colors.white,
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: '$baseURL/dist/thumbnail/sociology/' + img,
            height: 80,
            width: 80,
            fit: BoxFit.fill,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                this.title,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: GoogleFonts.ptSerif(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
