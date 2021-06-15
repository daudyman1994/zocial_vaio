import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserSearch extends StatefulWidget {
  @override
  _UserSearchState createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {
  List<OrganizerSearchUser> chatUsers = [
    OrganizerSearchUser(
      name: "Jane Russel",
      imageURL: "images/avatar_1.png",
    ),
    OrganizerSearchUser(
      name: "Jane Russel",
      imageURL: "images/avatar_2.png",
    ),
    OrganizerSearchUser(
      name: "Jane Russel",
      imageURL: "images/avatar_3.png",
    ),
    OrganizerSearchUser(
      name: "Jane Russel",
      imageURL: "images/avatar_1.png",
    ),
    OrganizerSearchUser(
      name: "Jane Russel",
      imageURL: "images/avatar_2.png",
    ),
    OrganizerSearchUser(
      name: "Jane Russel",
      imageURL: "images/avatar_3.png",
    ),
    OrganizerSearchUser(
      name: "Jane Russel",
      imageURL: "images/avatar_3.png",
    ),
    OrganizerSearchUser(
      name: "Jane Russel",
      imageURL: "images/avatar_1.png",
    ),
    OrganizerSearchUser(
      name: "Jane Russel",
      imageURL: "images/avatar_2.png",
    ),
    OrganizerSearchUser(
      name: "Jane Russel",
      imageURL: "images/avatar_3.png",
    ),
  ];
  Widget _searchWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0, left: 16, right: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey.shade600),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade600,
            size: 20,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(8),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 40),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                    child: Column(
                      children: [
                        ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              Divider(),
                          itemCount: chatUsers.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 16),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return OrganizerSearchUserList(
                              name: chatUsers[index].name,
                              imageUrl: chatUsers[index].imageURL,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 15.0,
            right: 15.0,
            child: _searchWidget(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAndroid(context);
  }
}

class OrganizerSearchUser {
  String name;
  String imageURL;
  OrganizerSearchUser({
    required this.name,
    required this.imageURL,
  });
}

class OrganizerSearchUserList extends StatefulWidget {
  final String name;
  final String imageUrl;
  OrganizerSearchUserList({
    required this.name,
    required this.imageUrl,
  });
  @override
  _OrganizerSearchUserListState createState() =>
      _OrganizerSearchUserListState();
}

class _OrganizerSearchUserListState extends State<OrganizerSearchUserList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.imageUrl),
                    maxRadius: 20,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xff29E145),
              child: IconButton(
                iconSize: 20,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.check, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
