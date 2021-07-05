import 'package:flutter/material.dart';

class SociologyTestResultScreen extends StatefulWidget {
  final right;
  final wrong;

  const SociologyTestResultScreen({Key key, this.right, this.wrong})
      : super(key: key);
  @override
  _SociologyTestResultScreenState createState() =>
      _SociologyTestResultScreenState();
}

class _SociologyTestResultScreenState extends State<SociologyTestResultScreen> {
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
