import 'dart:math';

import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_lorem/flutter_lorem.dart';

// import '../../utils.dart';
import '../../widgets.dart';

class EventChatDetail extends StatefulWidget {
  static const title = 'EventChat';
  static const androidIcon = Icon(Icons.directions_run);
  static const iosIcon = Icon(CupertinoIcons.sportscourt);

  _EventChatDetailState createState() => _EventChatDetailState();
}

class _EventChatDetailState extends State<EventChatDetail> {
  int _itemsLength = 0;
  late List<ChatMessage> messages;

  @override
  void initState() {
    messages = [
      ChatMessage(
          name: "Jasmin",
          imageUrl: "images/avatar_1.png",
          messageContent: "Hello, Jonathan",
          messageType: "receiver",
          time: "2021-05-20 20:49:12",
          isMessageRead: true),
      ChatMessage(
          name: "Janathan",
          imageUrl: "images/avatar_2.png",
          messageContent: "How have you been?",
          messageType: "sender",
          time: "2021-05-20 20:49:12",
          isMessageRead: true),
      ChatMessage(
          name: "Jasmin",
          imageUrl: "images/avatar_3.png",
          messageContent: "Hey Kriss, I am doing fine dude. wbu?",
          messageType: "receiver",
          time: "2021-05-20 20:49:12",
          isMessageRead: false),
      ChatMessage(
          name: "Janathan",
          imageUrl: "images/avatar_1.png",
          messageContent: "Hey Kriss, I am doing fine dude. wbu?",
          messageType: "sender",
          time: "2021-05-20 20:49:12",
          isMessageRead: false),
      ChatMessage(
          name: "Jasmin",
          imageUrl: "images/avatar_2.png",
          messageContent: "Hey Kriss, I am doing fine dude. wbu?",
          messageType: "receiver",
          time: "2021-05-20 20:49:12",
          isMessageRead: true),
      ChatMessage(
          name: "Janathan",
          imageUrl: "images/avatar_1.png",
          messageContent: "Hey Kriss, I am doing fine dude. wbu?",
          messageType: "sender",
          time: "2021-05-20 20:49:12",
          isMessageRead: false),
      ChatMessage(
          name: "Janathan",
          imageUrl: "images/avatar_1.png",
          messageContent: "Hey Kriss, I am doing fine dude. wbu?",
          messageType: "receiver",
          time: "2021-05-20 20:49:12",
          isMessageRead: false),
    ];
    _itemsLength = messages.length;
    super.initState();
  }

  Widget _listBuilder(BuildContext context, int index) {
    if (messages[index].messageType == "receiver") {
      return Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 0,
                  right: 32,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(messages[index].imageUrl),
                          radius: 18,
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(0.0),
                            ),
                            color: Colors.grey.shade200,
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                messages[index].name,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                messages[index].messageContent,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(messages[index].time),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Align(
          alignment: Alignment.topRight,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 32,
                  right: 0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(0.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                            color: Color(0xff82C034),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                messages[index].name,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                messages[index].messageContent,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(messages[index].time)
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(messages[index].imageUrl),
                          radius: 18,
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  // ===========================================================================
  // Non-shared code below because this tab uses different scaffolds.
  // ===========================================================================

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppCustomBar(
        title: EventChatDetail.title,
        subtitle: "",
        actionIcon: false,
        pushable: true,
        actionIconTitle: '',
      ),
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6),
            color: Colors.white,
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    // padding: EdgeInsets.only(top: 10, bottom: 10),
                    padding: EdgeInsets.only(top: 0, bottom: 10),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: _listBuilder,
                    itemCount: _itemsLength,
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            heightFactor: 30,
            child: Container(
              padding: EdgeInsets.only(left: 19, right: 19, bottom: 0, top: 0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Color(0xFFEEEBEB)),
                  left: BorderSide(width: 0.0, color: Color(0xFFFFFFFF)),
                  right: BorderSide(width: 0.0, color: Color(0xFF000000)),
                  bottom: BorderSide(width: 0.0, color: Color(0xFF000000)),
                ),
                color: Colors.white,
              ),
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      // print("camera is here ===== ");
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Transform.rotate(
                        angle: 45 * pi / 180,
                        child: Icon(
                          Icons.attach_file,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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

class ChatMessage {
  String name;
  // String messageTitle;
  String messageContent;
  String messageType;
  String imageUrl;
  String time;
  bool isMessageRead;
  ChatMessage(
      {required this.name,
      required this.imageUrl,
      // required this.messageTitle,
      required this.messageContent,
      required this.messageType,
      required this.time,
      required this.isMessageRead});
}
