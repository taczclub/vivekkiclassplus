import 'package:flutter/material.dart';

class SociologyTestResultScreen extends StatefulWidget {
  final total;
  final right;
  final wrong;

  const SociologyTestResultScreen({Key key, this.right, this.wrong, this.total})
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
        centerTitle: true,
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Right: ${widget.right}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Wrong: ${widget.wrong}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Precentage:${widget.right / widget.total * 100}%',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
