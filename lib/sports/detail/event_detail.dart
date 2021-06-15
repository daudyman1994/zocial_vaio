import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../../widgets.dart';
import './event_chat_detail.dart';

class EventDetailPage extends StatefulWidget {
  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height - 80,
          color: Colors.white, // Your screen background color
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3 - 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/event_sport.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Football Event is name",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: <Widget>[
                                  Icon(Icons.location_on_outlined,
                                      color: Color(0xffFFAA20)),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    "Football sport event name is here",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ConstrainedBox(
                                constraints:
                                    BoxConstraints.tightFor(height: 25),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red, // background
                                    onPrimary: Colors.white, // foreground
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 0),
                                    // textStyle:
                                    //     TextStyle(fontSize: 12),
                                  ),
                                  onPressed: () {},
                                  child: Text('Only 1 Spot Left!'),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 6,
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xffF5F7F8),
                                ),
                                child: Column(
                                  children: [
                                    Text("3/8"),
                                    Text("Personen"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 6,
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xffF5F7F8),
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.home,
                                      color: Colors.green,
                                    ),
                                    Text("Personen"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.42,
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xffF5F7F8),
                                ),
                                child: Column(
                                  children: [
                                    Text("22.02.2020 - 19:30 Uhr"),
                                    Text("Sprots events"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(lorem(paragraphs: 1, words: 30)),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height / 4,
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height / 25,
                                horizontal: 0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage("images/event_detail_back.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: ArrangeActiveMemberAvatar(activeMembers: [
                              "images/avatar_1.png",
                              "images/avatar_3.png",
                              "images/avatar_2.png",
                            ]),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 80,
          child: Container(
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xFFEEEBEB)),
                left: BorderSide(width: 0.0, color: Color(0xFFFFFFFF)),
                right: BorderSide(width: 0.0, color: Color(0xFF000000)),
                bottom: BorderSide(width: 0.0, color: Color(0xFF000000)),
              ),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "4.6 Euro",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "/ Per Person",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(height: 40, width: 120),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff82C034), // background
                          onPrimary: Colors.white, // foreground
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          // textStyle:
                          //     TextStyle(fontSize: 12),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Book',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 15.0,
          left: 15.0,
          right: 15.0,
          child: AppBar(
            leadingWidth: 40,
            title: Text(''), // You can add title here
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: IconButton(
                iconSize: 20,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            actions: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.chat,
                    color: Color(0xff82C034),
                  ),
                  onPressed: () {
                    // do something
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EventChatDetail()),
                    );
                  },
                ),
              ),
            ],
            backgroundColor:
                Colors.blue.withOpacity(0.0), //You can make this transparent
            elevation: 0.0, //No shadow
          ),
        ),
      ]),
    );
  }
}
