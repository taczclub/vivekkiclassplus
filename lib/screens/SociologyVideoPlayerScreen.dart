import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/sociologyvideos.dart';
import '../components/videoplayerscreen/SociologyVideoTile.dart';
import 'package:better_player/better_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/base_url.dart';
import 'package:wakelock/wakelock.dart';

class SociologyVideoPlayerScreen extends StatefulWidget {
  final String id;
  SociologyVideoPlayerScreen({@required this.id});

  @override
  _SociologyVideoPlayerScreenState createState() =>
      _SociologyVideoPlayerScreenState();
}

class _SociologyVideoPlayerScreenState
    extends State<SociologyVideoPlayerScreen> {
  GlobalKey _betterPlayerKey = GlobalKey();
  BetterPlayerController _betterPlayerController;
  var videos;
  var video;
  var activeVideo;
  var title;
  String errorMessage = '';
  String token = '';
  bool overlay = false;
  List<BetterPlayerController> bControllers = [];

  BetterPlayerConfiguration betterPlayerConfiguration =
      BetterPlayerConfiguration(
    aspectRatio: 16 / 9,
    fit: BoxFit.contain,

    // overlay: Container(
    //   color: Colors.red.withAlpha(200),
    // ),
    // placeholder: Center(
    //   child: SizedBox(
    //     height: 20,
    //     width: 20,
    //     child: CircularProgressIndicator(),
    //   ),
    // ),
    autoDispose: true,
    autoDetectFullscreenDeviceOrientation: false,
    autoPlay: true,
    deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
    controlsConfiguration: BetterPlayerControlsConfiguration(
      enableProgressText: true,
      showControls: true,
      enablePip: true,
      // progressBarBackgroundColor: Colors.red,
      customControlsBuilder: (controller) {
        return Container(
          height: 50,
          color: Colors.blue,
        );
      },
    ),
  );

  fetchVideo() async {
    // get token
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = await getSociologyVideos(widget.id);
    setState(() {
      token = prefs.getString('token') ?? '';
      videos = res['msg'];
      if (videos.length != 0) {
        video = videos[0]['basename'];
        activeVideo = 0;
        title = videos[0]['title'];
      }
    });
  }

  @override
  void initState() {
    // get video
    fetchVideo();
    super.initState();
  }

  @override
  void dispose() {
    Wakelock.disable();
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      '$baseURL/sociologyvideos/getvideo?basename=$video&quality=480p',
      notificationConfiguration: BetterPlayerNotificationConfiguration(
        showNotification: true,
        title: title ?? '',
        author: 'Dr. Vivek',
        imageUrl:
            '$baseURL/dist/thumbnail/sociology/${videos != null && videos.length != 0 ? videos[activeVideo]['thumbnail'] : ''}',
      ),
      resolutions: {
        // '360p':
        // '$baseURL/sociologyvideos/getvideo?basename=$video&quality=360p',
        '480p':
            '$baseURL/sociologyvideos/getvideo?basename=$video&quality=480p',
        '720p':
            '$baseURL/sociologyvideos/getvideo?basename=$video&quality=720p',
        // '1080p':
        // '$baseURL/sociologyvideos/getvideo?basename=$video&quality=1080p'
      },
      headers: {
        'Authorization': 'Bearer ' + token,
      },
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration,
        betterPlayerDataSource: dataSource);
    // _betterPlayerController.isPlaying()
    _betterPlayerController.enablePictureInPicture(_betterPlayerKey);
    Wakelock.enable();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sociology Video Player',
          style: GoogleFonts.ptSerif(fontWeight: FontWeight.w600),
        ),
      ),
      body: videos == null
          ? Center(child: CircularProgressIndicator())
          : videos.length == 0
              ? Center(child: Text('No Video Found'))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BetterPlayer(
                      controller: _betterPlayerController,
                      key: _betterPlayerKey,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        (activeVideo + 1).toString() +
                            '. ' +
                            videos[activeVideo]['title'],
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.ptSerif(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: videos.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              final oldController = _betterPlayerController;
                              WidgetsBinding.instance
                                  .addPostFrameCallback((_) async {
                                await oldController.dispose();
                              });
                              setState(() {
                                activeVideo = index;
                                video = videos[index]['basename'];
                                _betterPlayerController = null;
                              });
                            },
                            child: Card(
                              child: SociologyVideoTile(
                                img: videos[index]['thumbnail'],
                                title: (index + 1).toString() +
                                    '. ' +
                                    videos[index]['title'],
                                active: activeVideo == index ? true : false,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}
