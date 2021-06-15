import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'app_state_container.dart';
import './models/app_state.dart';
// import 'auth/auth_screen.dart';

import './home/home_tab.dart';
import './home/sports_tab.dart';
import './home/buchungen_tab.dart';
import './home/setting_tab.dart';
import './widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late AppState appState;

  Widget get _pageToDisplay {
    if (appState.isLoading) {
      return _loadingView;
    }
    // else if (!appState.isLoading && appState.user == null) {
    //   return new AuthScreen();
    // } else {
    //   return _homeView;
    // }
    else {
      return _homeView;
    }
  }

  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  Widget get _homeView {
    return ZocialHomePage();
  }

  @override
  Widget build(BuildContext context) {
    var container = AppStateContainer.of(context);
    appState = container.state;
    Widget body = _pageToDisplay;

    return new Scaffold(
      body: body,
    );
  }
}

class ZocialHomePage extends StatefulWidget {
  ZocialHomePage({Key? key}) : super(key: key);

  @override
  _ZocialHomePageState createState() => _ZocialHomePageState();
}

class _ZocialHomePageState extends State<ZocialHomePage> {
  final homeTabKey = GlobalKey();
  callback(tempTabIndex) {
    setState(() {
      // print("tab index is here ==== $tempTabIndex");
      _controller.index = tempTabIndex;
    });
  }

  Color activeTabColor = Color(0xff82C034);
  Color stackTabColor = Color(0xff82C034);
  tabCallback(tempColor) {
    setState(() {
      if (_controller.index == 1) {
        activeTabColor = tempColor;
        stackTabColor = tempColor;
      }
    });
  }

  Color bottomNavbarActiveIconColor = Color(0xFFFFFFFF);
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    // SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  late PersistentTabController _controller;
  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    // controller.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens() {
    return [
      HomeTab(key: homeTabKey, callback: this.callback),
      SportsTab(
        callback: this.tabCallback,
        triggerBottombar: this.callback,
      ),
      BuchungenTab(),
      SettingTab()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: HomeTab.androidIcon,
        title: (""),
        activeColorPrimary: bottomNavbarActiveIconColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SportsTab.androidIcon,
        title: (""),
        activeColorPrimary: bottomNavbarActiveIconColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: BuchungenTab.iosIcon,
        title: (""),
        activeColorPrimary: bottomNavbarActiveIconColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SettingTab.androidIcon,
        title: (""),
        activeColorPrimary: bottomNavbarActiveIconColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItemsIOS() {
    return [
      PersistentBottomNavBarItem(
        icon: HomeTab.iosIcon,
        title: (""),
        activeColorPrimary: bottomNavbarActiveIconColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SportsTab.iosIcon,
        title: (""),
        activeColorPrimary: bottomNavbarActiveIconColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: BuchungenTab.iosIcon,
        title: (""),
        activeColorPrimary: bottomNavbarActiveIconColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SettingTab.iosIcon,
        title: (""),
        activeColorPrimary: bottomNavbarActiveIconColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  Widget _buildAndroidHomePage(BuildContext context) {
    // return HomeTab(
    //   key: homeTabKey,
    //   androidDrawer: _AndroidDrawer(
    //     tabKey: homeTabKey,
    //   ),
    // );
    return PersistentTabView.custom(
      context,
      controller: _controller,
      itemCount: _navBarsItems()
          .length, // This is required in case of custom style! Pass the number of items for the nav bar.
      screens: _buildScreens(),
      confineInSafeArea: true,
      handleAndroidBackButtonPress: false,
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      customWidget: CustomNavBarWidget(
        // Your custom widget goes here
        items: _navBarsItems(),
        selectedIndex: _controller.index,
        activeTabColor: activeTabColor,
        onItemSelected: (index) {
          setState(() {
            _controller.index = index;
            if (index != 1) activeTabColor = Color(0xff82C034);
            if (index == 1) activeTabColor = stackTabColor;
          });
        },
      ),
    );
  }

  Widget _buildIosHomePage(BuildContext context) {
    // return CupertinoTabScaffold(
    //   tabBar: CupertinoTabBar(
    //     items: [
    //       BottomNavigationBarItem(
    //         label: HomeTab.title,
    //         icon: HomeTab.iosIcon,
    //       ),
    //       BottomNavigationBarItem(
    //         label: SportsTab.title,
    //         icon: SportsTab.iosIcon,
    //       ),
    //       BottomNavigationBarItem(
    //         label: BuchungenTab.title,
    //         icon: BuchungenTab.iosIcon,
    //       ),
    //       BottomNavigationBarItem(
    //         label: SettingTab.title,
    //         icon: SettingTab.iosIcon,
    //       ),
    //     ],
    //   ),
    //   tabBuilder: (context, index) {
    //     switch (index) {
    //       case 0:
    //         return CupertinoTabView(
    //           defaultTitle: HomeTab.title,
    //           builder: (context) =>
    //               HomeTab(key: homeTabKey, callback: this.callback),
    //         );
    //       case 1:
    //         return CupertinoTabView(
    //           defaultTitle: SportsTab.title,
    //           builder: (context) => SportsTab(),
    //         );
    //       case 2:
    //         return CupertinoTabView(
    //           defaultTitle: BuchungenTab.title,
    //           builder: (context) => BuchungenTab(),
    //         );
    //       case 3:
    //         return CupertinoTabView(
    //           defaultTitle: SettingTab.title,
    //           builder: (context) => SettingTab(),
    //         );
    //       default:
    //         assert(false, 'Unexpected tab');
    //         return SizedBox.shrink();
    //     }
    //   },
    // );
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItemsIOS(),
      confineInSafeArea: false,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: false, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      onItemSelected: (index) {
        // print("selected index is $index");
        setState(() {
          _controller.index = index; // NOTE: THIS IS CRITICAL!! Don't miss it!
        });
      },
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroidHomePage,
      iosBuilder: _buildIosHomePage,
    );
  }
}
// class _AndroidDrawer extends StatelessWidget {
//   const _AndroidDrawer({
//     Key? key,
//     required this.tabKey,
//   }) : super(key: key);

//   final tabKey;
//   @override
//   Widget build(BuildContext context) {
//     // return Drawer(
//     //   child: Column(
//     //     crossAxisAlignment: CrossAxisAlignment.stretch,
//     //     children: [
//     //       DrawerHeader(
//     //         decoration: BoxDecoration(color: Colors.green),
//     //         child: Padding(
//     //           padding: const EdgeInsets.only(bottom: 20),
//     //           child: Icon(
//     //             Icons.account_circle,
//     //             color: Colors.green.shade800,
//     //             size: 96,
//     //           ),
//     //         ),
//     //       ),
//     //       ListTile(
//     //         leading: HomeTab.androidIcon,
//     //         title: Text(HomeTab.title),
//     //         onTap: () {
//     //           Navigator.pop(context);
//     //         },
//     //       ),
//     //       ListTile(
//     //         leading: SportsTab.androidIcon,
//     //         title: Text(SportsTab.title),
//     //         onTap: () {
//     //           Navigator.pop(context);
//     //           Navigator.push<void>(context,
//     //               MaterialPageRoute(builder: (context) => SportsTab()));
//     //         },
//     //       ),
//     //       ListTile(
//     //         leading: BuchungenTab.androidIcon,
//     //         title: Text(BuchungenTab.title),
//     //         onTap: () {
//     //           Navigator.pop(context);
//     //           Navigator.push<void>(context,
//     //               MaterialPageRoute(builder: (context) => BuchungenTab()));
//     //         },
//     //       ),
//     //       // Long drawer contents are often segmented.
//     //       Padding(
//     //         padding: const EdgeInsets.symmetric(horizontal: 16),
//     //         child: Divider(),
//     //       ),
//     //       ListTile(
//     //         leading: SettingTab.androidIcon,
//     //         title: Text(SettingTab.title),
//     //         onTap: () {
//     //           Navigator.pop(context);
//     //           Navigator.push<void>(context,
//     //               MaterialPageRoute(builder: (context) => SettingTab()));
//     //         },
//     //       ),
//     //     ],
//     //   ),
//     // );
//     return CupertinoTabScaffold(
//       tabBar: CupertinoTabBar(
//         items: [
//           BottomNavigationBarItem(
//             label: HomeTab.title,
//             icon: HomeTab.iosIcon,
//           ),
//           BottomNavigationBarItem(
//             label: SportsTab.title,
//             icon: SportsTab.iosIcon,
//           ),
//           BottomNavigationBarItem(
//             label: BuchungenTab.title,
//             icon: BuchungenTab.iosIcon,
//           ),
//           BottomNavigationBarItem(
//             label: SettingTab.title,
//             icon: SettingTab.iosIcon,
//           ),
//         ],
//       ),
//       tabBuilder: (context, index) {
//         switch (index) {
//           case 0:
//             return CupertinoTabView(
//               defaultTitle: HomeTab.title,
//               builder: (context) => HomeTab(key: tabKey),
//             );
//           case 1:
//             return CupertinoTabView(
//               defaultTitle: SportsTab.title,
//               builder: (context) => SportsTab(),
//             );
//           case 2:
//             return CupertinoTabView(
//               defaultTitle: BuchungenTab.title,
//               builder: (context) => BuchungenTab(),
//             );
//           case 3:
//             return CupertinoTabView(
//               defaultTitle: SettingTab.title,
//               builder: (context) => SettingTab(),
//             );
//           default:
//             assert(false, 'Unexpected tab');
//             return SizedBox.shrink();
//         }
//       },
//     );
//   }
// }
