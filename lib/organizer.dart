import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widgets.dart';
import './citymanager/user_search.dart';
import './citymanager/active.dart';

class Organizer extends StatefulWidget {
  static const title = 'New Organizer';
  _OrganizerState createState() => _OrganizerState();
}

class _OrganizerState extends State<Organizer> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;

        // print("currnet index is here $_currentIndex");
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  // ===========================================================================
  // Non-shared code below because this tab uses different scaffolds.
  // ===========================================================================

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppCustomBar(
        title: Organizer.title,
        subtitle: "",
        actionIcon: false,
        pushable: true,
        actionIconTitle: '',
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: _currentIndex,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            backgroundColor: const Color(0xFFFFFFFF).withOpacity(0.0),
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Color(0xff82C034),
                  indicatorWeight: 5,
                  // isScrollable: true,
                  controller: _tabController,
                  tabs: [
                    Text(
                      "User Search",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff646876),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Active",
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
              UserSearch(),
              Active(),
              // BookingActivePage(),
              // BookingPassPage(),
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return _buildAndroid(context);
  }
}
