import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

import 'models/app_state.dart';
import 'preferenceUtils/localStorageUtil.dart';

class AppStateContainer extends StatefulWidget {
  final AppState? state;
  final Widget child;

  AppStateContainer({
    required this.child,
    this.state,
  });

  // This creates a method on the AppState that's just like 'of'
  // On MediaQueries, Theme, etc
  // This is the secret to accessing your AppState all over your app
  static _AppStateContainerState of(BuildContext context) {
    return (context
                .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()
            as _InheritedStateContainer)
        .data;
  }

  @override
  _AppStateContainerState createState() => new _AppStateContainerState();
}

class _AppStateContainerState extends State<AppStateContainer> {
  late AppState state;
  // late GoogleSignInAccount googleUser;
  // final googleSignIn = new GoogleSignIn();

  @override
  void initState() {
    super.initState();
    if (widget.state != null) {
      print("app container first is here ====== ");
      state = widget.state!;
    } else {
      print("app container second is here ====== ");
      state = new AppState.loading();
      setState(() {
        state.isLoading = false;
      });
      // initUser();
    }
  }

  Future initUser() async {
    // googleUser = await _ensureLoggedInOnStartUp();
    // if (googleUser == null) {
    //   setState(() {
    //     state.isLoading = false;
    //   });
    // } else {
    //   var firebaseUser = await logIntoFirebase();
    // }
  }
  onLogout(BuildContext context) {
    LocalStorageUtil.instance.setBooleanValue("loggedIn", false);
    setState(() {
      print("login first is here ============= ");
      state.isLoading = false;
      state.isLoggedIn = false;
      Navigator.pushNamed(context, '/');
    });
  }

  logIntoFirebase(BuildContext context) async {
    LocalStorageUtil.instance.setBooleanValue("loggedIn", true);
    setState(() {
      print("login first is here ============= ");
      state.isLoading = false;
      state.isLoggedIn = true;
    });

    // if (googleUser == null) {
    //   googleUser = await googleSignIn.signIn();
    // }

    // FirebaseUser firebaseUser;
    // FirebaseAuth _auth = FirebaseAuth.instance;
    // try {
    //   GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    //   firebaseUser = await _auth.signInWithGoogle(
    //     accessToken: googleAuth.accessToken,
    //     idToken: googleAuth.idToken,
    //   );
    //   print('Logged in: ${firebaseUser.displayName}');
    //   setState(() {
    //     state.isLoading = false;
    //     state.user = firebaseUser;
    //   });
    // } catch (error) {
    //   print(error);
    //   return null;
    // }
  }

  // Future<dynamic> _ensureLoggedInOnStartUp() async {
  //   GoogleSignInAccount user = googleSignIn.currentUser;
  //   if (user == null) {
  //     user = await googleSignIn.signInSilently();
  //   }
  //   googleUser = user;
  //   return user;
  // }

  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final _AppStateContainerState data;

  _InheritedStateContainer({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
