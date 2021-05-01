import 'package:flutter/material.dart';

// ignore: must_be_immutable
class YellowAlert extends StatefulWidget {
  String msg;
  YellowAlert({@required this.msg});
  @override
  _YellowAlertState createState() => _YellowAlertState();
}

class _YellowAlertState extends State<YellowAlert> {
  @override
  Widget build(BuildContext context) {
    return widget.msg == ''
        ? Container(
            height: 0,
          )
        : Container(
            // height: 40,
            width: 300,
            decoration: BoxDecoration(color: Colors.red),
            padding: EdgeInsets.all(8),
            child: ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: 5.0,
                minWidth: 2,
                maxHeight: 50.0,
                maxWidth: 50.0,
              ),
              child: Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 5),
                      child: Icon(Icons.info_outline, color: Colors.white),
                    ),
                    Expanded(
                      child: Text(
                        widget.msg.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.msg = '';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
