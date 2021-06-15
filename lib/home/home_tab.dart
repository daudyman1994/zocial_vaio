import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

// import 'song_detail_tab.dart';
import '../widgets.dart';
import '../organizer.dart';
// import './buchungen_tab.dart';
// import 'sports_tab.dart';

// ignore: must_be_immutable
class HomeTab extends StatefulWidget {
  static const title = 'Zocial Zports';
  static const androidIcon = Icon(Icons.location_on_outlined);
  static const iosIcon = Icon(CupertinoIcons.location_solid);

  Function callback;
  // const HomeTab({Key? key, this.androidDrawer}) : super(key: key);
  HomeTab({Key? key, required this.callback});

  // final Widget? androidDrawer;

  @override
  _HomeTabState createState() => _HomeTabState(callback: this.callback);
}

class _HomeTabState extends State<HomeTab> {
  int _itemsLength = 0;

  Function callback;
  _HomeTabState({
    required this.callback,
  });
  final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();

  List<CityCard> cityCardLists = [];
  @override
  void initState() {
    _setData();
    super.initState();
  }

  void _setData() {
    cityCardLists = [
      CityCard(cityName: "COLOGNE", imageUrl: "images/city_manager/city_1.png"),
      CityCard(cityName: "MUNICH", imageUrl: "images/city_manager/city_2.png"),
      CityCard(cityName: "KASSEL", imageUrl: "images/city_manager/city_3.png"),
    ];
    _itemsLength = cityCardLists.length;
  }

  Future<void> _refreshData() {
    return Future.delayed(
      // This is just an arbitrary delay that simulates some network activity.
      const Duration(seconds: 2),
      () => setState(() => _setData()),
    );
  }

  Widget _listBuilder(BuildContext context, int index) {
    if (index >= _itemsLength) return Container();
    return SafeArea(
      top: false,
      bottom: false,
      child: Hero(
        tag: index,
        child: HeroAnimationEventCard(
          title: cityCardLists[index].cityName,
          backgroundImage: cityCardLists[index].imageUrl,
          heroAnimation: AlwaysStoppedAnimation(0),
          onPressed: () {
            widget.callback(1);
          },
        ),
      ),
    );
  }

  // ===========================================================================
  // Non-shared code below because:
  // - Android and iOS have different scaffolds
  // - There are differenc items in the app bar / nav bar
  // - Android has a hamburger drawer, iOS has bottom tabs
  // - The iOS nav bar is scrollable, Android is not
  // - Pull-to-refresh works differently, and Android has a button to trigger it too
  //
  // And these are all design time choices that doesn't have a single 'right'
  // answer.
  // ===========================================================================

  void navigatorOrganizer() {
    pushNewScreen(
      context,
      screen: Organizer(),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppCustomBar(
        title: "ZOCIAL",
        subtitle: "ZPORTS",
        actionIcon: true,
        // callback: () async => await _androidRefreshKey.currentState!.show(),
        callback: navigatorOrganizer,
        titleColor: Color(0xff82C034),
        actionIconTitle: 'Organizer',
        actionIconData: Icons.person_add,
        actionIconColor: Color(0xff82C034),
      ),
      // drawer: widget.androidDrawer,
      body: RefreshIndicator(
        key: _androidRefreshKey,
        onRefresh: _refreshData,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 12),
          itemCount: _itemsLength,
          itemBuilder: _listBuilder,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return _buildAndroid(context);
  }
}

class CityCard {
  String cityName;
  String imageUrl;
  CityCard({
    required this.cityName,
    required this.imageUrl,
  });
}
