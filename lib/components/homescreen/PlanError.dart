import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanError extends StatefulWidget {
  final String msg;
  final double height;
  PlanError({@required this.msg, @required this.height});

  @override
  State<StatefulWidget> createState() => PlanErrorState();
}

class PlanErrorState extends State<PlanError>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.bounceOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
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
                width: 220,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.error_outline_sharp,
                      size: 80,
                      color: Colors.amber,
                    ),
                    Text(
                      'Pay To Learn Classes!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.ptSerif(
                        fontSize: 20,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.msg,
                      style: GoogleFonts.ptSerif(
                        fontSize: 17,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: RaisedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            color: Colors.redAccent,
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.ptSerif(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: RaisedButton(
                            onPressed: () => {
                              Navigator.of(context).pop(),
                              Navigator.of(context).pushNamed('login_screen')
                            },
                            color: Colors.green,
                            child: Text(
                              'Login',
                              style: GoogleFonts.ptSerif(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
              vertical: 5,
            ),
            child: SizedBox(
              height: 15,
              width: 100,
              child: Center(child: Text(widget.msg)),
            ),
          ),
        ),
      ),
    );
  }
}
