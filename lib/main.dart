import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'app_state_container.dart';

// void sharedPrefInit() async {
//   try {
//     /// Checks if shared preference exist
//     Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//     final SharedPreferences prefs = await _prefs;
//     prefs.getString("app-name");
//   } catch (err) {
//     /// setMockInitialValues initiates shared preference
//     /// Adds app-name
//     SharedPreferences.setMockInitialValues({});
//     Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//     final SharedPreferences prefs = await _prefs;
//     prefs.setString("app-name", "zocial_app");
//   }
// }

void main() {
  // sharedPrefInit();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new AppStateContainer(
    child: new AppRootWidget(),
  ));
}
