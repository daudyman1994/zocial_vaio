import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

/// A simple widget that builds different things on different platforms.
class PlatformWidget extends StatelessWidget {
  const PlatformWidget({
    Key? key,
    required this.androidBuilder,
    required this.iosBuilder,
  }) : super(key: key);

  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;

  @override
  Widget build(context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidBuilder(context);
      case TargetPlatform.iOS:
        return iosBuilder(context);
      default:
        assert(false, 'Unexpected platform $defaultTargetPlatform');
        return SizedBox.shrink();
    }
  }
}

class AppCustomBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(barHeight);
  const AppCustomBar({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.actionIcon,
    required this.actionIconTitle,
    this.callback,
    this.titleColor,
    this.pushable,
    this.actionIconData,
    this.actionIconColor,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool actionIcon;
  final VoidCallback? callback;
  final Color? titleColor;
  final bool? pushable;
  final IconData? actionIconData;
  final Color? actionIconColor;
  final String actionIconTitle;

  static const double barHeight = 62;

  Widget _titleWidget(BuildContext context) {
    if (subtitle == "" || subtitle.length == 0) {
      if (pushable == true) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    color: titleColor != null ? titleColor : Color(0xff646876),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ],
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                color: titleColor != null ? titleColor : Color(0xff646876),
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        );
      }
    } else {
      if (pushable == true) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            titleColor != null ? titleColor : Color(0xff646876),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF9C9EA7),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: titleColor != null ? titleColor : Color(0xff646876),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9C9EA7),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        );
      }
    }
  }

  Widget actionIconWidget(String tempActionIconTitle) {
    if (tempActionIconTitle == "")
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              callback!();
            },
            child: Column(
              children: [
                Icon(
                  this.actionIconData,
                  color: this.actionIconColor,
                  size: 24,
                ),
              ],
            ),
          ),
        ],
      );
    else
      return Column(
        children: [
          GestureDetector(
            onTap: () {
              callback!();
            },
            child: Icon(
              this.actionIconData,
              color: this.actionIconColor,
              size: 24,
            ),
          ),
          Text(
            actionIconTitle,
            style: TextStyle(
                fontSize: 11,
                color: Color(0xFF9C9EA7),
                fontWeight: FontWeight.normal),
          )
        ],
      );
  }

  @override
  Widget build(context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;
    if (actionIcon) {
      return PreferredSize(
        preferredSize: Size.fromHeight(barHeight),
        child: AppBar(
          automaticallyImplyLeading: false, // hides leading widget
          flexibleSpace: Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: statusbarHeight),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(context),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    actionIconWidget(this.actionIconTitle),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return PreferredSize(
        preferredSize: Size.fromHeight(barHeight),
        child: AppBar(
          automaticallyImplyLeading: false, // hides leading widget
          flexibleSpace: Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: statusbarHeight),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(context),
              ],
            ),
          ),
        ),
      );
    }
  }
}

/// A platform-agnostic card with a high elevation that reacts when tapped.
///
/// This is an example of a custom widget that an app developer might create for
/// use on both iOS and Android as part of their brand's unique design.
class PressableCard extends StatefulWidget {
  const PressableCard({
    this.onPressed,
    required this.color,
    required this.flattenAnimation,
    this.child,
  });

  final VoidCallback? onPressed;
  final Color color;
  final Animation<double> flattenAnimation;
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard>
    with SingleTickerProviderStateMixin {
  bool pressed = false;
  late final AnimationController controller;
  late final Animation<double> elevationAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 40),
    );
    elevationAnimation =
        controller.drive(CurveTween(curve: Curves.easeInOutCubic));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double get flatten => 1 - widget.flattenAnimation.value;

  @override
  Widget build(context) {
    return Listener(
      onPointerDown: (details) {
        if (widget.onPressed != null) {
          controller.forward();
        }
      },
      onPointerUp: (details) {
        controller.reverse();
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          widget.onPressed?.call();
        },
        // This widget both internally drives an animation when pressed and
        // responds to an external animation to flatten the card when in a
        // hero animation. You likely want to modularize them more in your own
        // app.
        child: AnimatedBuilder(
          animation:
              Listenable.merge([elevationAnimation, widget.flattenAnimation]),
          child: widget.child,
          builder: (context, child) {
            return Transform.scale(
              // This is just a sample. You likely want to keep the math cleaner
              // in your own app.
              scale: 1 - elevationAnimation.value * 0.03,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16) *
                    flatten,
                child: PhysicalModel(
                  elevation:
                      ((1 - elevationAnimation.value) * 10 + 10) * flatten,
                  borderRadius: BorderRadius.circular(26 * flatten),
                  clipBehavior: Clip.antiAlias,
                  color: widget.color,
                  child: child,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SportsPressableCard extends StatefulWidget {
  const SportsPressableCard({
    this.onPressed,
    required this.color,
    required this.flattenAnimation,
    this.child,
  });

  final VoidCallback? onPressed;
  final Color color;
  final Animation<double> flattenAnimation;
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _SportsPressableCardState();
}

class _SportsPressableCardState extends State<SportsPressableCard>
    with SingleTickerProviderStateMixin {
  bool pressed = false;
  late final AnimationController controller;
  late final Animation<double> elevationAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 40),
    );
    elevationAnimation =
        controller.drive(CurveTween(curve: Curves.easeInOutCubic));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double get flatten => 1 - widget.flattenAnimation.value;

  @override
  Widget build(context) {
    return Listener(
      onPointerDown: (details) {
        if (widget.onPressed != null) {
          controller.forward();
        }
      },
      onPointerUp: (details) {
        controller.reverse();
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          widget.onPressed?.call();
        },
        // This widget both internally drives an animation when pressed and
        // responds to an external animation to flatten the card when in a
        // hero animation. You likely want to modularize them more in your own
        // app.
        child: AnimatedBuilder(
          animation:
              Listenable.merge([elevationAnimation, widget.flattenAnimation]),
          child: widget.child,
          builder: (context, child) {
            return Transform.scale(
              // This is just a sample. You likely want to keep the math cleaner
              // in your own app.
              scale: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16) *
                    flatten,
                child: PhysicalModel(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(12),
                  clipBehavior: Clip.antiAlias,
                  color: widget.color,
                  child: child,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// A platform-agnostic card representing a song which can be in a card state,
/// a flat state or anything in between.
///
/// When it's in a card state, it's pressable.
///
/// This is an example of a custom widget that an app developer might create for
/// use on both iOS and Android as part of their brand's unique design.
class HeroAnimationEventCard extends StatelessWidget {
  HeroAnimationEventCard({
    required this.title,
    required this.heroAnimation,
    required this.backgroundImage,
    this.onPressed,
  });

  final String title;
  final Animation<double> heroAnimation;
  final String backgroundImage;
  final VoidCallback? onPressed;

  // double get playButtonSize => 50 + 50 * heroAnimation.value;

  @override
  Widget build(context) {
    // This is an inefficient usage of AnimatedBuilder since it's rebuilding
    // the entire subtree instead of passing in a non-changing child and
    // building a transition widget in between.
    //
    // Left simple in this demo because this card doesn't have any real inner
    // content so this just rebuilds everything while animating.
    // print(backgroundImage);
    return AnimatedBuilder(
      animation: heroAnimation,
      builder: (context, child) {
        return PressableCard(
          onPressed: heroAnimation.value == 0 ? onPressed : null,
          color: Colors.white.withOpacity(0.0),
          flattenAnimation: heroAnimation,
          child: SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(backgroundImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      height: 200,
                      color: Colors.black38,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(0),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HeroAnimationSportsEventCard extends StatelessWidget {
  HeroAnimationSportsEventCard({
    required this.title,
    required this.heroAnimation,
    required this.backgroundImage,
    required this.arenaName,
    required this.eventTime,
    this.onPressed,
  });

  final String title;
  final Animation<double> heroAnimation;
  final String backgroundImage;
  final String arenaName;
  final String eventTime;
  final VoidCallback? onPressed;

  // double get playButtonSize => 50 + 50 * heroAnimation.value;

  @override
  Widget build(context) {
    // This is an inefficient usage of AnimatedBuilder since it's rebuilding
    // the entire subtree instead of passing in a non-changing child and
    // building a transition widget in between.
    //
    // Left simple in this demo because this card doesn't have any real inner
    // content so this just rebuilds everything while animating.
    // print(backgroundImage);
    return AnimatedBuilder(
      animation: heroAnimation,
      builder: (context, child) {
        return SportsPressableCard(
          onPressed: heroAnimation.value == 0 ? onPressed : null,
          color: Colors.white.withOpacity(0.0),
          flattenAnimation: heroAnimation,
          child: SizedBox(
            height: 316,
            child: Column(
              // alignment: Alignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: 146,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(backgroundImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                // The play button grows in the hero animation.
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    height: 170,
                    // width: playButtonSize,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      color: Color(0xffffffff),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 25, bottom: 0),
                            child: (Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(title,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xff000000),
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        ConstrainedBox(
                                          constraints: BoxConstraints.tightFor(
                                              height: 25),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red, // background
                                              onPrimary:
                                                  Colors.white, // foreground
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 0),
                                              // textStyle:
                                              //     TextStyle(fontSize: 12),
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        8.0),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text('Only 1 Spot Left!'),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 1.0,
                                        ),
                                        Icon(Icons.av_timer_sharp,
                                            size: 12, color: Color(0xff858585)),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          eventTime,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff858585),
                                              fontWeight: FontWeight.normal),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 1.0,
                                        ),
                                        Icon(Icons.home,
                                            size: 12, color: Color(0xff82C034)),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          "inside",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Container(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                    arenaName,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                            Color(0xff000000),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                // width: 100,
                                                child: Row(
                                                  children: [
                                                    StackImagePlacer(
                                                        activeMembers: [
                                                          "images/avatar_1.png",
                                                          "images/avatar_3.png",
                                                          "images/avatar_2.png",
                                                        ]),
                                                    SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    Text(
                                                      "+6/7",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Color(0xff000000),
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// booking event card widget is here
class BookingEventCard extends StatelessWidget {
  BookingEventCard({
    required this.title,
    required this.heroAnimation,
    required this.backgroundImage,
    required this.eventTime,
    this.onPressed,
  });

  final String title;
  final Animation<double> heroAnimation;
  final String backgroundImage;
  final String eventTime;
  final VoidCallback? onPressed;

  // double get playButtonSize => 50 + 50 * heroAnimation.value;

  @override
  Widget build(context) {
    // This is an inefficient usage of AnimatedBuilder since it's rebuilding
    // the entire subtree instead of passing in a non-changing child and
    // building a transition widget in between.
    //
    // Left simple in this demo because this card doesn't have any real inner
    // content so this just rebuilds everything while animating.
    // print(backgroundImage);
    return AnimatedBuilder(
      animation: heroAnimation,
      builder: (context, child) {
        return SportsPressableCard(
          onPressed: heroAnimation.value == 0 ? onPressed : null,
          color: Colors.white.withOpacity(0.0),
          flattenAnimation: heroAnimation,
          child: SizedBox(
            height: 300,
            child: Column(
              // alignment: Alignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(backgroundImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                // The play button grows in the hero animation.
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    height: 150,
                    // width: playButtonSize,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      color: Color(0xffffffff),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 0),
                            child: (Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(title,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xff000000),
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.av_timer_sharp,
                                          color: Color(0xff858585),
                                          size: 12,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          eventTime,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff858585),
                                              fontWeight: FontWeight.normal),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.home,
                                          size: 12,
                                          color: Color(0xff82C034),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          "inside",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff000000),
                                              fontWeight: FontWeight.w900),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Container(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ConstrainedBox(
                                                constraints:
                                                    BoxConstraints.tightFor(
                                                        height: 26),
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors
                                                        .red, // background
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(15),
                                                      side: BorderSide(
                                                          color: Colors.red),
                                                    ),
                                                    onPrimary: Colors
                                                        .white, // foreground
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 0),
                                                    // textStyle:
                                                    //     TextStyle(fontSize: 12),
                                                  ),
                                                  onPressed: () {},
                                                  child: Text('Cancel'),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              ConstrainedBox(
                                                constraints:
                                                    BoxConstraints.tightFor(
                                                        height: 26),
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors
                                                        .white, // background
                                                    shadowColor:
                                                        Colors.transparent,
                                                    shape:
                                                        new RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(15),
                                                      side: BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                    ),
                                                    onPrimary: Colors
                                                        .transparent, // foreground
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 0),
                                                    // textStyle:
                                                    //     TextStyle(fontSize: 12),
                                                  ),
                                                  onPressed: () {},
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        "Detail",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Color(
                                                                0xFF000000),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900),
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                      SizedBox(
                                                        width: 5.0,
                                                      ),
                                                      Icon(Icons.arrow_forward,
                                                          color: Color(
                                                              0xFF000000)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// end booking event card widget is here
/// A loading song tile's silhouette.
///
/// This is an example of a custom widget that an app developer might create for
/// use on both iOS and Android as part of their brand's unique design.
class SongPlaceholderTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          children: [
            Container(
              color: Theme.of(context).textTheme.bodyText2!.color,
              width: 130,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 9,
                    margin: EdgeInsets.only(right: 60),
                    color: Theme.of(context).textTheme.bodyText2!.color,
                  ),
                  Container(
                    height: 9,
                    margin: EdgeInsets.only(right: 20, top: 8),
                    color: Theme.of(context).textTheme.bodyText2!.color,
                  ),
                  Container(
                    height: 9,
                    margin: EdgeInsets.only(right: 40, top: 8),
                    color: Theme.of(context).textTheme.bodyText2!.color,
                  ),
                  Container(
                    height: 9,
                    margin: EdgeInsets.only(right: 80, top: 8),
                    color: Theme.of(context).textTheme.bodyText2!.color,
                  ),
                  Container(
                    height: 9,
                    margin: EdgeInsets.only(right: 50, top: 8),
                    color: Theme.of(context).textTheme.bodyText2!.color,
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
// Non-shared code below because different interfaces are shown to prompt
// for a multiple-choice answer.
//
// This is a design choice and you may want to do something different in your
// app.
// ===========================================================================
/// This uses a platform-appropriate mechanism to show users multiple choices.
///
/// On Android, it uses a dialog with radio buttons. On iOS, it uses a picker.
void showChoices(BuildContext context, List<String> choices) {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      showDialog<void>(
        context: context,
        builder: (context) {
          int? selectedRadio = 1;
          return AlertDialog(
            contentPadding: EdgeInsets.only(top: 12),
            content: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List<Widget>.generate(choices.length, (index) {
                    return RadioListTile<int?>(
                      title: Text(choices[index]),
                      value: index,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() => selectedRadio = value);
                      },
                    );
                  }),
                );
              },
            ),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('CANCEL'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
      return;
    case TargetPlatform.iOS:
      showCupertinoModalPopup<void>(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 250,
            child: CupertinoPicker(
              backgroundColor: Theme.of(context).canvasColor,
              useMagnifier: true,
              magnification: 1.1,
              itemExtent: 40,
              scrollController: FixedExtentScrollController(initialItem: 1),
              children: List<Widget>.generate(choices.length, (index) {
                return Center(
                  child: Text(
                    choices[index],
                    style: TextStyle(
                      fontSize: 21,
                    ),
                  ),
                );
              }),
              onSelectedItemChanged: (value) {},
            ),
          );
        },
      );
      return;
    default:
      assert(false, 'Unexpected platform $defaultTargetPlatform');
  }
}

// ignore: must_be_immutable
class StackImagePlacer extends StatelessWidget {
  late final List<String> activeMembers;
  StackImagePlacer({
    Key? key,
    required this.activeMembers,
  });

  List<Widget> avatarList = [];
  void makeAvatarList(context) {
    this.avatarList = [];
    // print(MediaQuery.of(context).size.width.toString());
    for (var i = 0; i < this.activeMembers.length; i++) {
      double paddingUnit = (MediaQuery.of(context).size.width / 3 - 90) /
          (this.activeMembers.length - 1);
      // print(paddingUnit.toString());
      avatarList.add(
        Padding(
          padding: EdgeInsets.only(left: paddingUnit / 2 * i),
          child: CircleAvatar(
            backgroundImage: AssetImage(this.activeMembers[i]),
            radius: 18,
            backgroundColor: Colors.transparent,
            // child: Icon(Icons.add),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    makeAvatarList(context);
    return Center(
      child: Stack(
        children: avatarList,
      ),
    );
  }
}

class ArrangeActiveMemberAvatar extends StatelessWidget {
  final List<String> activeMembers;
  ArrangeActiveMemberAvatar({
    Key? key,
    required this.activeMembers,
  });

  late final List<Widget> avatarList;
  void makeAvatarList(context) {
    this.avatarList = [];
    // print(MediaQuery.of(context).size.width.toString());
    List<Widget> tempWidgetList = [];
    for (var i = 0; i < 15; i++) {
      // double paddingUnit = (MediaQuery.of(context).size.width - 90) / 5;
      // print(paddingUnit.toString());
      if ((i + 1) % 5 == 0) {
        tempWidgetList.add(
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage(this.activeMembers[i % 3]),
              radius: 18,
              backgroundColor: Colors.transparent,
              // child: Icon(Icons.add),
            ),
          ),
        );

        avatarList.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: tempWidgetList,
        ));
        tempWidgetList = [];
      } else {
        final double paddingLeft = ((i + 1) % 5 == 1) ? 0 : 10.0;
        tempWidgetList.add(
          Padding(
            padding: EdgeInsets.only(left: paddingLeft),
            child: CircleAvatar(
              backgroundImage: AssetImage(this.activeMembers[i % 3]),
              radius: 18,
              backgroundColor: Colors.transparent,
              // child: Icon(Icons.add),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    makeAvatarList(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: avatarList,
      ),
    );
  }
}

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem>
      items; // NOTE: You CAN declare your own model here instead of `PersistentBottomNavBarItem`.
  final ValueChanged<int> onItemSelected;
  final Color activeTabColor;

  CustomNavBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
    required this.activeTabColor,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected,
      Color tempTabActiveColor, BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 44.0,
        width: 88,
        decoration: BoxDecoration(
          color: isSelected ? tempTabActiveColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: IconTheme(
                data: IconThemeData(
                    size: 26.0,
                    color: isSelected
                        ? (item.activeColorSecondary == null
                            ? item.activeColorPrimary
                            : item.activeColorSecondary)
                        : item.inactiveColorPrimary == null
                            ? item.activeColorPrimary
                            : item.inactiveColorPrimary),
                child: item.icon,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Container(
        width: double.infinity,
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            int index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  this.onItemSelected(index);
                },
                child: _buildItem(
                    item, selectedIndex == index, activeTabColor, context),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
