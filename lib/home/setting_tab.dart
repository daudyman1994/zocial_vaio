import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../app_state_container.dart';
import '../models/app_state.dart';
import '../auth/auth_screen.dart';

import '../widgets.dart';
import '../setting/profile_setting.dart';
import '../preferenceUtils/localStorageUtil.dart';

// ignore: must_be_immutable
class SettingTab extends StatefulWidget {
  static const title = 'Zocial Zports';
  static const androidIcon = Icon(Icons.person);
  static const iosIcon = Icon(CupertinoIcons.person);
  const SettingTab({Key? key}) : super(key: key);

  @override
  _SettingTabState createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  late AppState state;
  late List<AboutItem> aboutItems;
  @override
  void initState() {
    aboutItems = [
      AboutItem(itemName: "Age", itemData: "36"),
      AboutItem(itemName: "Language1", itemData: ""),
      AboutItem(itemName: "Language2", itemData: ""),
      AboutItem(itemName: "Favorite Team", itemData: ""),
      AboutItem(itemName: "Best Footballer", itemData: ""),
    ];
    print("this is the logged in page");
    LocalStorageUtil.instance.getBooleanValue("loggedIn").then((value) {
      setState(() {
        print("this is the logged in page111111");
        state.isLoggedIn = value;
      });
    });

    super.initState();
  }

  Widget get _pageToDisplay {
    // print("is login data is here ==== $isLogin");
    if (state.isLoggedIn) {
      return _buildAndroid;
    } else {
      return _authScreen;
    }
  }

  void navigatorOrganizer() {
    pushNewScreen(
      context,
      screen: ProfileSetting(),
      withNavBar: false, // OPTIONAL VALUE. True by default.
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  Widget get _authScreen {
    return Scaffold(
      // drawer: widget.androidDrawer,
      body: new AuthScreen(),
    );
  }

  Widget get _buildAndroid {
    return Scaffold(
      appBar: AppCustomBar(
        title: "MY PROFILE",
        subtitle: "",
        actionIcon: true,
        // callback: () async => await _androidRefreshKey.currentState!.show(),
        callback: navigatorOrganizer,
        titleColor: Color(0xff000000),
        actionIconTitle: "",
        actionIconData: Icons.settings,
        actionIconColor: Color(0xffA0A0A0),
      ),
      // drawer: widget.androidDrawer,
      body: profileView,
    );
  }

  Widget get settingAvatar {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: CircleAvatar(
        radius: 70,
        child: ClipOval(
          child: Image.asset(
            'images/setting/profile.png',
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget get settingAvatarTitle {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Text(
        "Jonas Albrecht",
        style: TextStyle(
          color: Color(0xFF000000),
          fontSize: 15.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget get settingAvatarDetail {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      width: 173,
      height: 53,
      child: Card(
        shadowColor: Colors.grey,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "7",
                      style: TextStyle(
                          color: Color(0xff82C034),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "JOINED",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.0,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
              Container(
                width: 1,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffEBEBEB),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "12,30",
                      style: TextStyle(
                          color: Color(0xff82C034),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "BALANCE",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.0,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get settingDetailList {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 0,
                bottom: 5,
                top: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ABOUT ME',
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xffEFEFEF),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: aboutItems.length,
                  itemBuilder: _listBuilder,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listBuilder(BuildContext context, int index) {
    return Column(
      children: [
        ListTile(
          title: Text(
              '${aboutItems[index].itemName}:${aboutItems[index].itemData}'),
        ),
        Divider(
          color: Colors.grey,
        )
      ],
    );
  }

  Widget get profileView {
    return Container(
      color: Color(0xffF1F1F1),
      child: Column(
        children: <Widget>[
          settingAvatar,
          settingAvatarTitle,
          settingAvatarDetail,
          settingDetailList,
        ],
      ),
    );
  }

  @override
  Widget build(context) {
    var container = AppStateContainer.of(context);
    state = container.state;

    Widget body = _pageToDisplay;
    return body;
  }
}

class AboutItem {
  String itemName;
  String? itemData;
  AboutItem({
    required this.itemName,
    this.itemData,
  });
}
