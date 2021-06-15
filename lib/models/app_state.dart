// import 'package:firebase_auth/firebase_auth.dart';

import 'package:zocial_vaio/preferenceUtils/localStorageUtil.dart';

class AppState {
  bool isLoading;
  // FirebaseUser? user;
  final String? userRole;
  bool isLoggedIn;

  AppState({
    this.isLoading = false,
    this.userRole,
    this.isLoggedIn = false,
    // this.user,
  });

  factory AppState.loading() {
    bool tempLoggedIn = false;
    LocalStorageUtil.instance
        .getBooleanValue("loggedIn")
        .then((value) => tempLoggedIn = value);
    return new AppState(
      isLoading: true,
      isLoggedIn: tempLoggedIn,
    );
  }
  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, user: }';
  }
}
