import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'song_detail_tab.dart';
import '../app_state_container.dart';
import '../widgets.dart';

class ProfileSetting extends StatefulWidget {
  ProfileSetting({Key? key}) : super(key: key);

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppCustomBar(
        title: "SETTINGS",
        subtitle: "",
        actionIcon: false,
        actionIconTitle: "",
        pushable: true,
      ),
      // drawer: widget.androidDrawer,
      body: Container(
        color: Color(0xffF1F1F1),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.zero,
        child: Column(
          children: <Widget>[
            profileSettingAvatar,
            profileSettingItems,
            profileSettingFooter,
          ],
        ),
      ),
    );
  }

  Widget get profileSettingAvatar {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            width: MediaQuery.of(context).size.width - 100,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: new DecorationImage(
                image: new AssetImage('images/setting/profile_detail.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Text(""),
          ),
          Positioned(
            right: 20,
            top: 15,
            child: Container(
              height: 38,
              width: 38,
              child: IconButton(
                icon: const Icon(Icons.edit),
                color: Colors.black,
                onPressed: () {},
              ),
              decoration: BoxDecoration(
                  color: Color(0xffEFEFEF),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          )
        ],
      ),
    );
  }

  Widget get profileSettingItems {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Container(
        // height: 220,
        margin: EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 0,
                  top: 0,
                ),
                padding: EdgeInsets.only(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  top: 10,
                ),
                height: 45,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Change Name',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 0,
                  top: 0,
                ),
                padding: EdgeInsets.only(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  top: 10,
                ),
                height: 45,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 0,
                  top: 0,
                ),
                padding: EdgeInsets.only(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  top: 10,
                ),
                height: 45,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Terms of use',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 0,
                  top: 0,
                ),
                padding: EdgeInsets.only(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  top: 10,
                ),
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Imprint',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 25,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get profileSettingFooter {
    final container = AppStateContainer.of(context);
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                container.onLogout(context);
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 0,
                  top: 0,
                ),
                padding: EdgeInsets.only(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  top: 10,
                ),
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.phonelink_lock,
                              color: Colors.red,
                              size: 28,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              'Log out',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 0,
                  top: 0,
                ),
                padding: EdgeInsets.only(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  top: 10,
                ),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.g_translate,
                              color: Colors.red,
                              size: 28,
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Text(
                              'Delete Account',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAndroid(context);
  }
}
