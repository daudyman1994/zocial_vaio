import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'auth/auth_screen.dart';
import 'home_screen.dart';

class AppRootWidget extends StatefulWidget {
  @override
  AppRootWidgetState createState() => new AppRootWidgetState();
}

class AppRootWidgetState extends State<AppRootWidget> {
  ThemeData get _themeData => new ThemeData(
        primarySwatch: Colors.lightGreen,
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Zocial Zports',
      debugShowCheckedModeBanner: false,
      theme: _themeData,
      darkTheme: ThemeData.dark(),
      builder: (context, child) {
        return CupertinoTheme(
          // Instead of letting Cupertino widgets auto-adapt to the Material
          // theme (which is green), this app will use a different theme
          // for Cupertino (which is blue by default).
          data: CupertinoThemeData(),
          child: Material(child: child),
        );
      },
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => new HomeScreen(),
        '/auth': (BuildContext context) => new AuthScreen(),
      },
    );
  }
}
