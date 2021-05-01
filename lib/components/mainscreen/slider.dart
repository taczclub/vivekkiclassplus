import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../services/sliders.dart';
import '../../services/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainSlider extends StatefulWidget {
  @override
  _MainSliderState createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {
  int _current = 0;
  String errorMessage = '';
  List<Widget> slideritems = [
    Container(
        color: Colors.grey[200],
        child: Center(
          child: Text(
            'Slider Loading...',
            style: TextStyle(color: Colors.black),
          ),
        ))
  ];

  sliders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedItems = prefs.getString('slider');
    if (savedItems == null) {}
    var res = await getSliders();
    if (res['error']) {
      setState(() {
        errorMessage = res['msg'];
      });
    } else {
      setState(() {
        slideritems = [];
      });
      for (var r in res['msg']) {
        slideritems.add(
            SliderItem(imageUrl: '$baseURL/dist/sliders/${r['basename']}'));
      }
    }
  }

  @override
  void initState() {
    sliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
              height: MediaQuery.of(context).size.width / 2,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: slideritems,
        ),
        Positioned.fill(
          top: (MediaQuery.of(context).size.width / 2) - 28,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  // color: sliderContainerGrey,
                  ),
              child: SizedBox(
                height: 30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: slideritems.length,
                  itemBuilder: (context, index) {
                    return Pointer(
                      active: _current == index ? true : false,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SliderItem extends StatelessWidget {
  final String imageUrl;
  SliderItem({@required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}

class Pointer extends StatelessWidget {
  final bool active;
  Pointer({@required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: active
            ? Color.fromRGBO(0, 0, 0, 0.9)
            : Color.fromRGBO(0, 0, 0, 0.4),
      ),
    );
  }
}
