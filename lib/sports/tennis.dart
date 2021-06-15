import 'dart:math';

import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_lorem/flutter_lorem.dart';

// import '../utils.dart';
import '../widgets.dart';

class TennisPage extends StatefulWidget {
  static const title = 'Sports';
  static const androidIcon = Icon(Icons.sports_basketball_outlined);
  static const iosIcon = Icon(CupertinoIcons.sportscourt);
  final Function callback;
  TennisPage({required this.callback});
  _TennisState createState() => _TennisState(callback: this.callback);
}

class _TennisState extends State<TennisPage> {
  int _itemsLength = 0;
  late final List<TennisEventCard> tennisEventCards;
  Function callback;

  _TennisState({required this.callback});
  @override
  void initState() {
    tennisEventCards = [
      TennisEventCard(
        arenaName: "Soccer Arena",
        imageUrl: "images/sports_event/tennis_arena_1.png",
        eventName: "Football in Eltendorf",
        time: "22.02.2020 - 19:30 Uhr",
      ),
      TennisEventCard(
        arenaName: "Soccer Arena",
        imageUrl: "images/sports_event/tennis_arena_0.png",
        eventName: "Football in Eltendorf",
        time: "22.02.2020 - 19:30 Uhr",
      )
    ];
    _itemsLength = tennisEventCards.length;
    super.initState();
  }

  String _randomString(int length) {
    var rand = new Random(length);
    var codeUnits = rand.nextInt(100) + 89;
    return codeUnits.toString() + "_tennis";
  }

  Widget _listBuilder(BuildContext context, int index) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Hero(
        tag: _randomString(index + 10),
        child: HeroAnimationSportsEventCard(
          title: tennisEventCards[index].eventName.length < 20
              ? tennisEventCards[index].eventName
              : tennisEventCards[index].eventName.substring(0, 20),
          backgroundImage: tennisEventCards[index].imageUrl,
          eventTime: tennisEventCards[index].time,
          arenaName: tennisEventCards[index].arenaName,
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
      //   title: Text(Tennis.title),
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

class TennisEventCard {
  String arenaName;
  String eventName;
  String imageUrl;
  String time;
  TennisEventCard({
    required this.arenaName,
    required this.imageUrl,
    required this.eventName,
    required this.time,
  });
}
