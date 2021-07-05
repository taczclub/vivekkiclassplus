import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../services/ppnote.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:wakelock/wakelock.dart';

class PpNoteViewScreen extends StatefulWidget {
  final String title;
  final String pdf;
  PpNoteViewScreen({@required this.title, @required this.pdf});

  @override
  _PpNoteViewScreenState createState() => _PpNoteViewScreenState();
}

class _PpNoteViewScreenState extends State<PpNoteViewScreen> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  String remotePDFpath;
  int totalPages = 0;
  int currentPage = 0;
  bool isReady = false;
  bool pdfReady = false;
  String errorMessage = '';

  getFullPath() async {
    var tempDir = await getTemporaryDirectory();
    remotePDFpath = tempDir.path + '/temp.pdf';
    var res = await getPpNote(widget.pdf, remotePDFpath);
    print(res);
    setState(() {
      if (res['error']) {
        errorMessage = res['msg'];
        isReady = true;
      } else {
        pdfReady = true;
      }
      pdfReady = true;
    });
  }

  @override
  void initState() {
    getFullPath();
    // getPdfPath('http://192.168.43.20:3000/dist/notes/' + widget.pdf).then((f) {
    //   print('pdfpath' + f.path);
    //   setState(() {
    //     remotePDFpath = f.path;
    //   });
    // });
    super.initState();
  }

  @override
  void dispose() {
    Wakelock.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    isReady ? Wakelock.enable() : Wakelock.disable();

    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return true;
      },
      child: Scaffold(
        body: Column(
          children: [
            isPortrait
                ? AppBar(
                    centerTitle: true,
                    title: Text(widget.title),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          (currentPage + 1).toString() +
                              '/' +
                              totalPages.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ],
                  )
                : Container(),
            Expanded(
              child: pdfReady
                  ? Stack(
                      children: <Widget>[
                        PDFView(
                          filePath: remotePDFpath,
                          enableSwipe: true,
                          swipeHorizontal: false,
                          autoSpacing: false,
                          pageFling: false,
                          pageSnap: false,
                          defaultPage: currentPage,
                          fitPolicy: FitPolicy.BOTH,
                          preventLinkNavigation:
                              false, // if set to true the link is handled in flutter
                          onRender: (_pages) {
                            setState(() {
                              totalPages = _pages;
                              isReady = true;
                            });
                          },
                          onError: (error) {
                            if (errorMessage.isEmpty) {
                              setState(() {
                                // errorMessage = error.toString();
                                errorMessage =
                                    'Something went wrong please try again later';
                              });
                            }
                            // print(error.toString());
                          },
                          onPageError: (page, error) {
                            setState(() {
                              // errorMessage = '$page: ${error.toString()}';
                              errorMessage =
                                  'Something went wrong please try again later';
                            });
                          },
                          onViewCreated: (PDFViewController pdfViewController) {
                            _controller.complete(pdfViewController);
                          },
                          onLinkHandler: (String uri) {
                            // print('goto uri: $uri');
                          },
                          onPageChanged: (int page, int total) {
                            // print('page change: $page/$total');
                            setState(() {
                              currentPage = page;
                            });
                          },
                        ),
                        errorMessage.isEmpty
                            ? !isReady
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Container()
                            : Center(
                                child: Text(
                                  errorMessage,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.rotate_right),
          backgroundColor: Colors.grey,
          onPressed: () {
            if (isPortrait) {
              SystemChrome.setEnabledSystemUIOverlays([]);
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeRight,
                DeviceOrientation.landscapeLeft,
              ]);
            } else {
              SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
              ]);
            }
            Navigator.of(context)
                .pushReplacementNamed('pp_note_view', arguments: {
              'title': widget.title,
              'pdf': widget.pdf,
            });
          },
        ),
      ),
    );
  }
}
