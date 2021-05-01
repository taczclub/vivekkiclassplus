import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/help.dart';
import 'package:email_validator/email_validator.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  String _name = '';
  String _email = '';
  String _phone = '';
  String _details = '';
  bool _loading = false;

  void mail() async {
    var res = await sendEmail(
        {'name': _name, 'email': _email, 'phone': _phone, 'details': _details});
    if (!res['error']) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
        msg: 'Mail Sent',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
        msg: 'Something went wrong please try again later',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Help',
          style: GoogleFonts.ptSerif(fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      'For feedback, queries, and complaints, please submit this form and we will get in touch with you shortly',
                      style: GoogleFonts.ptSerif(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TextField(
                          onChanged: (value) => _name = value,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: 'Name',
                            hintStyle: GoogleFonts.ptSerif(),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                          ),
                          style: TextStyle(fontSize: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TextField(
                        onChanged: (value) => _email = value,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: GoogleFonts.ptSerif(),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                        ),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TextField(
                        onChanged: (value) => _phone = value,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Your phone number without +91',
                          hintStyle: GoogleFonts.ptSerif(),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                        ),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      height: 220,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: TextField(
                          onChanged: (value) => _details = value,
                          keyboardType: TextInputType.text,
                          textAlignVertical: TextAlignVertical.top,
                          expands: true,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Describe your query in detail words',
                            hintStyle: GoogleFonts.ptSerif(),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    // _loading ? CircularProgressIndicator() : Container(),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          if (!_loading) {
                            setState(() {
                              _loading = true;
                            });
                            if (_name == '') {
                              Fluttertoast.cancel();
                              Fluttertoast.showToast(
                                msg: 'Please enter a name',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              setState(() {
                                _loading = false;
                              });
                            } else if (!EmailValidator.validate(_email)) {
                              Fluttertoast.cancel();
                              Fluttertoast.showToast(
                                msg: 'Please enter a valid email',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              setState(() {
                                _loading = false;
                              });
                            } else if (_phone.length != 10) {
                              Fluttertoast.cancel();
                              Fluttertoast.showToast(
                                msg: 'Please enter a valid phone number',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              setState(() {
                                _loading = false;
                              });
                            } else if (_details.length < 20) {
                              Fluttertoast.cancel();
                              Fluttertoast.showToast(
                                msg:
                                    'Minimum 20 charactors is required in details field',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              setState(() {
                                _loading = false;
                              });
                            } else {
                              mail();
                            }
                          }
                        },
                        child: Text(
                          _loading ? 'Please Wait ...' : 'SUBMIT',
                          style: GoogleFonts.ptSerif(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          // _error != null
          //     ? Positioned.fill(
          //         child: Align(
          //           alignment: Alignment.bottomCenter,
          //           child: YellowAlert(
          //             msg: _error,
          //           ),
          //         ),
          //       )
          //     : Container(),
        ],
      ),
    );
  }
}
