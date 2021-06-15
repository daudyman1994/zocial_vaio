import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class HockeyPage extends StatefulWidget {
  static const title = 'Sports';
  static const androidIcon = Icon(Icons.sports_basketball_outlined);
  static const iosIcon = Icon(CupertinoIcons.sportscourt);
  final Function callback;
  HockeyPage({required this.callback});
  _HockeyState createState() => _HockeyState(callback: this.callback);
}

class _HockeyState extends State<HockeyPage> {
  int _itemsLength = 0;
  late final List<HockeylEventCard> hockeyEventCards;
  Function callback;
  _HockeyState({required this.callback});
  @override
  void initState() {
    hockeyEventCards = [
      HockeylEventCard(
        arenaName: "Soccer Arena",
        imageUrl: "images/sports_event/hockey_arena_0.png",
        eventName: "Football in Eltendorf",
        time: "22.02.2020 - 19:30 Uhr",
      ),
      HockeylEventCard(
        arenaName: "Soccer Arena",
        imageUrl: "images/sports_event/hockey_arena_1.png",
        eventName: "Football in Eltendorf",
        time: "22.02.2020 - 19:30 Uhr",
      )
    ];
    _itemsLength = hockeyEventCards.length;
    super.initState();
  }

  String _randomString(int length) {
    var rand = new Random(length);
    var codeUnits = rand.nextInt(200) + 89;
    return codeUnits.toString() + "_hockey";
  }

  Widget _listBuilder(BuildContext context, int index) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Hero(
        tag: _randomString(index + 10),
        child: HeroAnimationSportsEventCard(
          title: hockeyEventCards[index].eventName.length < 20
              ? hockeyEventCards[index].eventName
              : hockeyEventCards[index].eventName.substring(0, 20),
          backgroundImage: hockeyEventCards[index].imageUrl,
          arenaName: hockeyEventCards[index].arenaName,
          eventTime: hockeyEventCards[index].time,
          heroAnimation: AlwaysStoppedAnimation(0),
          onPressed: () {
            widget.callback();
          },
        ),
      ),
    );
  }

  // ===========================================================================
  // Non-shared code below because this tab uses different scaffolds.
  // ===========================================================================

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(Hockey.title),
      // ),
      body: Container(
        child: ListView.builder(
          itemCount: _itemsLength,
          itemBuilder: _listBuilder,
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: ListView.builder(
        itemCount: _itemsLength,
        itemBuilder: _listBuilder,
      ),
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}

class HockeylEventCard {
  String arenaName;
  String eventName;
  String imageUrl;
  String time;
  HockeylEventCard({
    required this.arenaName,
    required this.imageUrl,
    required this.eventName,
    required this.time,
  });
}
