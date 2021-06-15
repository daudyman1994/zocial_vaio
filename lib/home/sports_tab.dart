import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:zocial_vaio/sports/iceHockey.dart';

import '../sports/football.dart';
import '../sports/tennis.dart';
import '../sports/iceHockey.dart';
import '../sports/detail/event_detail.dart';
import '../widgets.dart';

class SportsTab extends StatefulWidget {
  static const title = 'Zocial Zports';
  static const androidIcon = Icon(Icons.directions_run);
  static const iosIcon = Icon(CupertinoIcons.sportscourt);
  final Function callback;
  final Function triggerBottombar;
  SportsTab({Key? key, required this.callback, required this.triggerBottombar});
  _SportsTabState createState() => _SportsTabState(callback: this.callback);
}

class _SportsTabState extends State<SportsTab> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  Function callback;
  _SportsTabState({required this.callback});
  sportEventCardCallback() {
    print("sports event callback is here======");
    pushNewScreen(
      context,
      screen: EventDetailPage(),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  Color _activeColor = Color(0xff82C034);
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
        switch (_currentIndex) {
          case 0:
            _activeColor = Color(0xff82C034);
            break;
          case 1:
            _activeColor = Color(0xffEF633C);
            break;
          case 2:
            _activeColor = Color(0xff0F3083);
            break;
          default:
        }

        widget.callback(_activeColor);
        // print("currnet index is here $_currentIndex");
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  // void _handleTabSelection(index) {
  //   setState(() {
  //     _currentIndex = index;
  //     print("currnet index is here $_currentIndex");
  //   });
  // }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppCustomBar(
        title: "ZOCIAL",
        subtitle: "ZPORTS",
        actionIcon: false,
        titleColor: _activeColor,
        actionIconTitle: '',
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: _currentIndex,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            flexibleSpace: Container(
              padding: new EdgeInsets.only(top: 8.0),
              child: Column(
                children: [
                  Center(
                    child: TabBar(
                      labelPadding: EdgeInsets.symmetric(horizontal: 8),
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      indicator: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(50), // Creates border
                          color: Colors.transparent),
                      controller: _tabController,
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.white,
                      unselectedLabelColor: Color(0xFFFFFFFF),
                      tabs: <Widget>[
                        SizedBox(
                          child: Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      50), // Creates border
                                  color: _currentIndex == 0
                                      ? _activeColor
                                      : Color(0xffD3D3D3)),
                              // padding: EdgeInsets.symmetric(horizontal: 16),
                              padding: EdgeInsets.only(left: 4, right: 6),
                              height: 35,
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.directions_run,
                                        color: _currentIndex == 0
                                            ? _activeColor
                                            : Color(0xffD3D3D3)),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "FOOTBALL",
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      50), // Creates border
                                  color: _currentIndex == 1
                                      ? _activeColor
                                      : Color(0xffD3D3D3)),
                              // padding: EdgeInsets.symmetric(horizontal: 16),
                              padding: EdgeInsets.only(left: 4, right: 6),
                              height: 35,
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                        Icons.sports_basketball_outlined,
                                        color: _currentIndex == 1
                                            ? _activeColor
                                            : Color(0xffD3D3D3)),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "TENNIS",
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Tab(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      50), // Creates border
                                  color: _currentIndex == 2
                                      ? _activeColor
                                      : Color(0xffD3D3D3)),
                              // padding: EdgeInsets.symmetric(horizontal: 16),
                              padding: EdgeInsets.only(left: 4, right: 6),
                              height: 35,
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.sports_hockey_outlined,
                                        color: _currentIndex == 2
                                            ? _activeColor
                                            : Color(0xffD3D3D3)),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "ICE HOCKEY",
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 35,
                    color: Color(0xffF5F7F8),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Color(0xffFFAA20),
                                    size: 28,
                                  ),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "standort wahlen...",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ConstrainedBox(
                                constraints:
                                    BoxConstraints.tightFor(height: 35),
                                child: IconButton(
                                  iconSize: 25,
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.arrow_forward),
                                  color: Colors.black,
                                  tooltip: 'Redirect city selection',
                                  onPressed: () {
                                    setState(() {
                                      widget.triggerBottombar(0);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            elevation: 0.0,
            backgroundColor: const Color(0xFFFFFFFF).withOpacity(0.0),
            // bottom: ,
          ),
          body: TabBarView(
            children: <Widget>[
              FootballPage(callback: this.sportEventCardCallback),
              TennisPage(callback: this.sportEventCardCallback),
              HockeyPage(callback: this.sportEventCardCallback),
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }

  // Widget _buildIos(BuildContext context) {
  //   // return CupertinoPageScaffold(
  //   //   navigationBar: CupertinoNavigationBar(),
  //   //   child: ListView.builder(
  //   //     itemCount: _itemsLength,
  //   //     itemBuilder: _listBuilder,
  //   //   ),
  //   // );
  //   return context;
  // }

  @override
  Widget build(context) {
    // return PlatformWidget(
    //   androidBuilder: _buildAndroid,
    //   iosBuilder: _buildIos,
    // );
    return _buildAndroid(context);
  }
}
