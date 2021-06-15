import 'dart:math';

import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import '../utils.dart';
import '../widgets.dart';

class FootballPage extends StatefulWidget {
  static const title = 'Sports';
  static const androidIcon = Icon(Icons.directions_run);
  static const iosIcon = Icon(CupertinoIcons.sportscourt);

  final Function callback;
  FootballPage({required this.callback});
  _FootballPageState createState() =>
      _FootballPageState(callback: this.callback);
}

class _FootballPageState extends State<FootballPage> {
  int _itemsLength = 0;

  late final List<FootballEventCard> footballEventCards;

  Function callback;
  _FootballPageState({required this.callback});
  @override
  void initState() {
    footballEventCards = [
      FootballEventCard(
        arenaName: "Soccer Arena",
        imageUrl: "images/sports_event/football_arena_0.png",
        eventName: "Football in Eltendorf",
        time: "22.02.2020 - 19:30 Uhr",
      ),
      FootballEventCard(
        arenaName: "Soccer Arena",
        imageUrl: "images/sports_event/football_arena_1.png",
        eventName: "Football in Eltendorf",
        time: "22.02.2020 - 19:30 Uhr",
      )
    ];
    _itemsLength = footballEventCards.length;
    super.initState();
  }

  String _randomString(int length) {
    var rand = new Random(length);
    var codeUnits = rand.nextInt(300) + 89;
    return codeUnits.toString() + "_football";
  }

  Widget _listBuilder(BuildContext context, int index) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Hero(
        tag: _randomString(index + 10),
        child: HeroAnimationSportsEventCard(
          title: footballEventCards[index].eventName.length < 20
              ? footballEventCards[index].eventName
              : footballEventCards[index].eventName.substring(0, 20),
          backgroundImage: footballEventCards[index].imageUrl,
          heroAnimation: AlwaysStoppedAnimation(0),
          arenaName: footballEventCards[index].arenaName,
          eventTime: footballEventCards[index].time,
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
      //   title: Text(FootballPage.title),
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

class FootballEventCard {
  String arenaName;
  String eventName;
  String imageUrl;
  String time;
  FootballEventCard({
    required this.arenaName,
    required this.imageUrl,
    required this.eventName,
    required this.time,
  });
}
