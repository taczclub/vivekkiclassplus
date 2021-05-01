import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanErrorWait extends StatefulWidget {
  final String msg;
  PlanErrorWait({@required this.msg});

  @override
  State<StatefulWidget> createState() => PlanErrorWaitState();
}

class PlanErrorWaitState extends State<PlanErrorWait> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0))),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: SizedBox(
              height: 260,
              width: 220,
              child: Text(
                widget.msg,
                style: GoogleFonts.ptSerif(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
