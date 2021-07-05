import 'package:flutter/material.dart';

class NetjrfTestResultScreen extends StatefulWidget {
  final right;
  final wrong;

  const NetjrfTestResultScreen({Key key, this.right, this.wrong})
      : super(key: key);
  @override
  _NetjrfTestResultScreenState createState() => _NetjrfTestResultScreenState();
}

class _NetjrfTestResultScreenState extends State<NetjrfTestResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff007aa5),
        centerTitle: true,
        title: Text(widget.right.toString()),
      ),
    );
  }
}
