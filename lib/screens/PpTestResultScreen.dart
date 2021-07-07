import 'package:flutter/material.dart';

class PpTestResultScreen extends StatefulWidget {
  final right;
  final wrong;

  const PpTestResultScreen({Key key, this.right, this.wrong}) : super(key: key);
  @override
  _PpTestResultScreenState createState() => _PpTestResultScreenState();
}

class _PpTestResultScreenState extends State<PpTestResultScreen> {
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
