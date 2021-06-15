import 'dart:math';

import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import '../utils.dart';
import '../widgets.dart';

class BookingActivePage extends StatefulWidget {
  static const title = 'Sports';
  static const androidIcon = Icon(Icons.directions_run);
  static const iosIcon = Icon(CupertinoIcons.sportscourt);

  _BookingActivePageState createState() => _BookingActivePageState();
}

class _BookingActivePageState extends State<BookingActivePage> {
  int _itemsLength = 10;
  late final List<ActiveBookingCard> activeBookingCards;
  @override
  void initState() {
    activeBookingCards = [
      ActiveBookingCard(
        imageUrl: "images/sports_event/football_arena_1.png",
        eventName: "Football in Eltendorf",
        time: "22.02.2020 - 19:30 Uhr",
      ),
      ActiveBookingCard(
        imageUrl: "images/sports_event/tennis_arena_1.png",
        eventName: "Football in Eltendorf",
        time: "22.02.2020 - 19:30 Uhr",
      ),
      ActiveBookingCard(
        imageUrl: "images/sports_event/hockey_arena_1.png",
        eventName: "Football in Eltendorf",
        time: "22.02.2020 - 19:30 Uhr",
      ),
    ];
    _itemsLength = activeBookingCards.length;
    super.initState();
  }

  String _randomString(int length) {
    var rand = new Random(length);
    var codeUnits = rand.nextInt(100) + 89;
    return codeUnits.toString() + "_active";
  }

  Widget _listBuilder(BuildContext context, int index) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Hero(
        tag: _randomString(index),
        child: BookingEventCard(
          title: activeBookingCards[index].eventName.length < 20
              ? activeBookingCards[index].eventName
              : activeBookingCards[index].eventName.substring(0, 20),
          backgroundImage: activeBookingCards[index].imageUrl,
          eventTime: activeBookingCards[index].time,
          heroAnimation: AlwaysStoppedAnimation(0),
          onPressed: () {
            // setState(() {
            //   Navigator.of(context).pushAndRemoveUntil(
            //     CupertinoPageRoute(
            //       builder: (BuildContext context) {
            //         return SportsTab();
            //       },
            //     ),
            //     (_) => false,
            //   );
            // });
            // widget.callback(1);
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
      //   title: Text(BookingActivePage.title),
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

class ActiveBookingCard {
  String eventName;
  String imageUrl;
  String time;
  ActiveBookingCard({
    required this.imageUrl,
    required this.eventName,
    required this.time,
  });
}
