import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:gsoc/model/care.dart';

import 'package:gsoc/util/color/hex_code.dart';
import 'package:gsoc/util/scroll/noglow.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';


class CarePage extends StatefulWidget {
  final Care care;
  final String heroTag;

  const CarePage({Key key, this.care, @required this.heroTag})
      : super(key: key);

  @override
  _CarePageState createState() => _CarePageState();
}

class _CarePageState extends State<CarePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  String id;
  int type;
  int underKM;
  int cost;
  String title;
  double latitude;
  double longitude;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    latitude = 50.0;
    longitude = 50;
    underKM = widget.care.underKM;
    cost = widget.care.cost;
    title = widget.care.care;

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: buildBottomBar(),
      body: Stack(
        children: <Widget>[
          buildBackground(),
          buildCarePage(context),
          buildBackButton(context),
        ],
      ),
    );
  }

  Container buildBottomBar() {
    return Container(
      height: 80,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Row(
              children: <Widget>[
                Spacer(),
                FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    MapsLauncher.launchCoordinates(37.4220041, -122.0862462);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(10))),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: double.infinity,
                    child: Text(
                      "LOCATE",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.black,
            ),
          )
        ],
      ),
      color: Colors.transparent,
    );
  }

  ScrollConfiguration buildCarePage(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlow(),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 200,
                  padding: const EdgeInsets.all(5),
                  child: AutoSizeText(
                    title ?? "Need To Update ",
                    presetFontSizes: [20.0, 18.0],
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ClipPath(
              clipper: CornerRadiusClipper(200),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  height: 45,
                  padding: EdgeInsets.only(
                    left: 5,
                    right: 5,
                    top: 10,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.5),
                  ),
                  child: TabBar(
                    indicatorColor: Colors.transparent,
                    unselectedLabelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    controller: tabController,
                    tabs: <Widget>[Text("Summary"), Text("Hospital")],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Colors.white.withOpacity(0.5)),
            height: MediaQuery.of(context).size.height * 0.5,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.all(5),
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      Text('Under : $underKM KM'),
                      Text('Cost : $cost'),
                      Text('Language Speak : English,French'),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text('Hospital Name : XYZ HOSPITAL'),
                      Text('Doctors : 123'),
                      Text('Parking Facility : Yes'),
                      Text('Longitude : XXXXX'),
                      Text('Latitude : YYYY'),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Positioned buildBackButton(BuildContext context) {
    return Positioned(
        top: 25,
        left: 6,
        child: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 30.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }

  Stack buildBackground() {
    return Stack(
      children: <Widget>[
        Center(
            child: SizedBox(
                child: Image.asset(
                  "assets/logowhite.png",
                  color: Colors.orange,
                ),
                height: 200)),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.1),
              end: FractionalOffset(0.7, 0.6),
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.8],
              colors: [
                HexColor("#ff0a6c").withOpacity(0.7),
                HexColor("#4a3cdb").withOpacity(0.7)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CornerRadiusClipper extends CustomClipper<Path> {
  final double radius;

  CornerRadiusClipper(this.radius);

  @override
  getClip(Size size) {
    final path = Path();
    final rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
