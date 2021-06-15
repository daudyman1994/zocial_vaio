import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';
import '../buchungen/active.dart';
import '../buchungen/pass.dart';

class BuchungenTab extends StatefulWidget {
  static const title = 'Buchungen';
  static const androidIcon = Icon(Icons.fit_screen);
  static const iosIcon = Icon(Icons.fit_screen);
  _BuchungenTabState createState() => _BuchungenTabState();
}

class _BuchungenTabState extends State<BuchungenTab>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  // Color _activeColor = Color(0xff82C034);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
        // switch (_currentIndex) {
        //   case 0:
        //     _activeColor = Color(0xff82C034);
        //     break;
        //   case 1:
        //     _activeColor = Color(0xffEF633C);
        //     break;
        //   default:
        // }
        // print("currnet index is here $_currentIndex");
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppCustomBar(
        title: "My Booking",
        subtitle: "",
        actionIcon: false,
        actionIconTitle: '',
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: _currentIndex,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: const Color(0xFFFFFFFF).withOpacity(0.0),
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.red,
                  indicatorWeight: 5,
                  // isScrollable: true,
                  controller: _tabController,
                  tabs: [
                    Text(
                      "Active",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff646876),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Passed",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff646876),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              BookingActivePage(),
              BookingPassPage(),
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }

  Widget build(context) {
    // return PlatformWidget(
    //   androidBuilder: _buildAndroid,
    //   iosBuilder: _buildIos,
    // );
    return _buildAndroid(context);
  }
}
