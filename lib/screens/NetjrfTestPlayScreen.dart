import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vivekkiclassplus/screens/NetjrfTestResultScreen.dart';
import 'package:vivekkiclassplus/screens/model.dart';

class NetjrfTestPlayScreen extends StatefulWidget {
  final List<dynamic> questions;
  final String duration;
  NetjrfTestPlayScreen({@required this.questions, @required this.duration});

  @override
  _NetjrfTestPlayScreenState createState() => _NetjrfTestPlayScreenState();
}

class _NetjrfTestPlayScreenState extends State<NetjrfTestPlayScreen> {
  // var question = Question.fromJson({
  //   "name": "Ash",
  //   "duration": "3:00",
  //   "question": "1. What does an HTML tag do?",
  //   "option": {
  //     "option_a": "A",
  //     "option_b": "B",
  //     "option_c": "C",
  //     "option_d": "D"
  //   },
  //   "right_answer": "option_a"
  // });
  String _value = "";
  String green = "";
  String red = "";
  bool isselected = false;
  var index = 0;
  var minutes = 0;
  var seconds = 0;
  var time = '';
  var right = 0;
  var wrong = 0;

  @override
  void initState() {
    super.initState();
    var d = widget.duration.split(':');
    // minutes = int.parse(d[0]);
    // seconds = int.parse(d[1]);
    minutes = 0;
    seconds = 5;
    startTimer(seconds, minutes);
  }

  @override
  Widget build(BuildContext context) {
    var question = widget.questions[index];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff007aa5),
        centerTitle: true,
        title: Text(time),
      ),
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                ListTile(
                    title: Text(
                  question['question'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
                RadioListTile(
                  value: 'option_a',
                  groupValue: _value,
                  title: Text(
                    question['option_a'],
                    style: TextStyle(
                      color: green == 'option_a'
                          ? Colors.green
                          : red == 'option_a'
                              ? Colors.red
                              : Colors.black,
                    ),
                  ),
                  onChanged: (val) {
                    if (_value == '') {
                      setState(() {
                        setV(question, val);
                      });
                    }
                  },
                  activeColor: green == 'option_a'
                      ? Colors.green
                      : red == 'option_a'
                          ? Colors.red
                          : Colors.black,
                ),
                RadioListTile(
                  value: 'option_b',
                  groupValue: _value,
                  title: Text(
                    question['option_b'],
                    style: TextStyle(
                      color: green == 'option_b'
                          ? Colors.green
                          : red == 'option_b'
                              ? Colors.red
                              : _value == ''
                                  ? Colors.black
                                  : Colors.grey,
                    ),
                  ),
                  onChanged: (val) {
                    if (_value == '') {
                      setState(() {
                        setV(question, val);
                      });
                    }
                  },
                  activeColor: green == 'option_b'
                      ? Colors.green
                      : red == 'option_b'
                          ? Colors.red
                          : Colors.black,
                ),
                RadioListTile(
                  value: 'option_c',
                  groupValue: _value,
                  title: Text(
                    question['option_c'],
                    style: TextStyle(
                      color: green == 'option_c'
                          ? Colors.green
                          : red == 'option_c'
                              ? Colors.red
                              : _value == ''
                                  ? Colors.black
                                  : Colors.grey,
                    ),
                  ),
                  onChanged: (val) {
                    // print(question['right_answer'] == _value && _value == 'option_a');
                    //print(val.toString());
                    if (_value == '') {
                      setState(() {
                        setV(question, val);
                      });
                    }
                  },
                  activeColor: green == 'option_c'
                      ? Colors.green
                      : red == 'option_c'
                          ? Colors.red
                          : _value == ''
                              ? Colors.black
                              : Colors.grey,
                ),
                RadioListTile(
                  value: 'option_d',
                  groupValue: _value,
                  title: Text(
                    question['option_d'],
                    style: TextStyle(
                      color: green == 'option_d'
                          ? Colors.green
                          : red == 'option_d'
                              ? Colors.red
                              : _value == ''
                                  ? Colors.black
                                  : Colors.grey,
                    ),
                  ),
                  onChanged: (val) {
                    // print(question['right_answer'] == _value && _value == 'option_a');
                    if (_value == '') {
                      setState(() {
                        setV(question, val);
                      });
                    }
                  },
                  activeColor: green == 'option_d'
                      ? Colors.green
                      : red == 'option_d'
                          ? Colors.red
                          : _value == ''
                              ? Colors.black
                              : Colors.grey,
                ),
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width / 1.11,
              child: TextButton(
                onPressed: () {
                  if (_value != '') {
                    nextQuestion();
                  }
                },
                child: Text('Next'),
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor:
                        _value != '' ? Color(0xff007aa5) : Colors.grey[400]),
              )),
        ],
      ),
    );
  }

  setV(question, val) {
    // print(question['right_answer']);
    _value = val.toString();
    switch (_value) {
      case 'option_a':
        if (question['right_answer'] == 'option_a') {
          green = 'option_a';
          red = '';
          right += 1;
        } else {
          green = question['right_answer'];
          red = 'option_a';
          wrong += 1;
        }
        break;
      case 'option_b':
        if (question['right_answer'] == 'option_b') {
          green = 'option_b';
          red = '';
          right += 1;
        } else {
          green = question['right_answer'];
          red = 'option_b';
          wrong += 1;
        }
        break;
      case 'option_c':
        if (question['right_answer'] == 'option_c') {
          green = 'option_c';
          red = '';
          right += 1;
        } else {
          green = question['right_answer'];
          red = 'option_c';
          wrong += 1;
        }
        break;
      case 'option_d':
        if (question['right_answer'] == 'option_d') {
          green = 'option_d';
          red = '';
          right += 1;
          break;
        } else {
          green = question['right_answer'];
          red = 'option_d';
          wrong += 1;
        }
        break;
    }
  }

  startTimer(seconds, minutes) {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (seconds > 0) {
          seconds = seconds - 1;
        } else if (minutes > 0) {
          minutes = minutes - 1;
          seconds = 60;
        } else {
          timer.cancel();
        }
        time = '$minutes:$seconds';
        if (minutes == 0 && seconds == 0) {
          Navigator.pushReplacement(
            context,
            PageTransition(
              duration: Duration(milliseconds: 00),
              type: PageTransitionType.rightToLeft,
              child: NetjrfTestResultScreen(),
            ),
          );
        }
      });
    });
  }

  nextQuestion() {
    if (index == widget.questions.length - 1) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          duration: Duration(milliseconds: 00),
          type: PageTransitionType.rightToLeft,
          child: NetjrfTestResultScreen(right: right, wrong: wrong),
        ),
      );
    } else {
      setState(() {
        _value = "";
        green = "";
        red = "";
        isselected = false;
        index += 1;
      });
    }
  }
}
