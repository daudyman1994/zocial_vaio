import 'package:flutter/material.dart';
// import 'package:zocial_vaio/models/app_state.dart';
import '../app_state_container.dart';
import 'customTextField.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late PersistentBottomSheetController _sheetController;
  late String _email;
  late String _password;
  late String _displayName;
  late bool _loading = false;
  late bool _autoValidate = false;
  late String errorMsg = "";

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    final container = AppStateContainer.of(context);
    //GO logo widget
    Widget logo() {
      return Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 220,
          child: Stack(
            children: <Widget>[
              Positioned(
                  child: Container(
                child: Align(
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    width: 150,
                    height: 150,
                  ),
                ),
                height: 154,
              )),
              Positioned(
                child: Container(
                    height: 154,
                    child: Align(
                      child: Text(
                        "GO",
                        style: TextStyle(
                          fontSize: 120,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.width * 0.15,
                bottom: MediaQuery.of(context).size.height * 0.046,
                right: MediaQuery.of(context).size.width * 0.22,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width * 0.08,
                height: MediaQuery.of(context).size.width * 0.08,
                bottom: 0,
                right: MediaQuery.of(context).size.width * 0.32,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    }

    //button widgets
    Widget filledButton(String text, Color splashColor, Color highlightColor,
        Color fillColor, Color textColor, void function()) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: fillColor,
          onPrimary: splashColor,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
        ),
        // color: fillColor,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
        ),
        onPressed: () {
          function();
        },
      );
    }

    outlineButton(void function()) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          onPrimary: Colors.white,
          elevation: 0.0,
          side: BorderSide(color: Colors.white, width: 2.0),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
        // highlightedBorderColor: Colors.white,
        child: Text(
          "REGISTER",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          function();
        },
      );
    }

    void _validateLoginInput() async {
      final FormState? form = _formKey.currentState;
      if (_formKey.currentState!.validate()) {
        // form!.save();
        _sheetController.setState!(() {
          _loading = true;
        });
        container.logIntoFirebase(context);
        // try {
        //   // FirebaseUser user = await FirebaseAuth.instance
        //   //     .signInWithEmailAndPassword(email: _email, password: _password);
        //   // Navigator.of(context).pushReplacementNamed('/home');
        // } catch (error) {
        //   switch (error.code) {
        //     case "ERROR_USER_NOT_FOUND":
        //       {
        //         _sheetController.setState!(() {
        //           errorMsg =
        //               "There is no user with such entries. Please try again.";

        //           _loading = false;
        //         });
        //         showDialog(
        //             context: context,
        //             builder: (BuildContext context) {
        //               return AlertDialog(
        //                 content: Container(
        //                   child: Text(errorMsg),
        //                 ),
        //               );
        //             });
        //       }
        //       break;
        //     case "ERROR_WRONG_PASSWORD":
        //       {
        //         _sheetController.setState(() {
        //           errorMsg = "Password doesn\'t match your email.";
        //           _loading = false;
        //         });
        //         showDialog(
        //             context: context,
        //             builder: (BuildContext context) {
        //               return AlertDialog(
        //                 content: Container(
        //                   child: Text(errorMsg),
        //                 ),
        //               );
        //             });
        //       }
        //       break;
        //     default:
        //       {
        //         _sheetController.setState(() {
        //           errorMsg = "";
        //         });
        //       }
        //   }
        // }
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    void _validateRegisterInput() async {
      final FormState? form = _formKey.currentState;
      if (_formKey.currentState!.validate()) {
        form!.save();
        _sheetController.setState!(() {
          _loading = true;
        });
        // try {
        //   FirebaseUser user = await FirebaseAuth.instance
        //       .createUserWithEmailAndPassword(
        //           email: _email, password: _password);
        //   UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
        //   userUpdateInfo.displayName = _displayName;
        //   user.updateProfile(userUpdateInfo).then((onValue) {
        //     Navigator.of(context).pushReplacementNamed('/home');
        //     Firestore.instance.collection('users').document().setData(
        //         {'email': _email, 'displayName': _displayName}).then((onValue) {
        //       _sheetController.setState(() {
        //         _loading = false;
        //       });
        //     });
        //   });
        // } catch (error) {
        //   switch (error.code) {
        //     case "ERROR_EMAIL_ALREADY_IN_USE":
        //       {
        //         _sheetController.setState(() {
        //           errorMsg = "This email is already in use.";
        //           _loading = false;
        //         });
        //         showDialog(
        //             context: context,
        //             builder: (BuildContext context) {
        //               return AlertDialog(
        //                 content: Container(
        //                   child: Text(errorMsg),
        //                 ),
        //               );
        //             });
        //       }
        //       break;
        //     case "ERROR_WEAK_PASSWORD":
        //       {
        //         _sheetController.setState(() {
        //           errorMsg = "The password must be 6 characters long or more.";
        //           _loading = false;
        //         });
        //         showDialog(
        //             context: context,
        //             builder: (BuildContext context) {
        //               return AlertDialog(
        //                 content: Container(
        //                   child: Text(errorMsg),
        //                 ),
        //               );
        //             });
        //       }
        //       break;
        //     default:
        //       {
        //         _sheetController.setState(() {
        //           errorMsg = "";
        //         });
        //       }
        //   }
        // }
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    String? emailValidator(String? value) {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (value!.isEmpty) return '*Required';
      if (!regex.hasMatch(value))
        return '*Enter a valid email';
      else
        return null;
    }

    void loginSheet() {
      _sheetController = _scaffoldKey.currentState!
          .showBottomSheet<void>((BuildContext context) {
        return DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).canvasColor),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 30.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    height: 50,
                    width: 50,
                  ),
                  SingleChildScrollView(
                      child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: Align(
                                  child: Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(bottom: 20, top: 60),
                            child: CustomTextField(
                              onSaved: (input) {
                                this._email = input!;
                              },
                              validator: emailValidator,
                              icon: Icon(Icons.email),
                              hint: "EMAIL",
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: CustomTextField(
                              icon: Icon(Icons.lock),
                              obsecure: true,
                              onSaved: (input) => _password = input!,
                              validator: (input) =>
                                  input!.isEmpty ? "*Required" : null,
                              hint: "PASSWORD",
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: _loading == true
                              ? CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      primaryColor),
                                )
                              : Container(
                                  child: filledButton(
                                      "LOGIN",
                                      Colors.white,
                                      primaryColor,
                                      primaryColor,
                                      Colors.white,
                                      _validateLoginInput),
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        );
      });
    }

    void registerSheet() {
      _sheetController = _scaffoldKey.currentState!
          .showBottomSheet<void>((BuildContext context) {
        return DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).canvasColor),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 30.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    height: 50,
                    width: 50,
                  ),
                  SingleChildScrollView(
                      child: Form(
                    child: Column(children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: Align(
                                child: Container(
                                  width: 130,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            Positioned(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 25, right: 40),
                                child: Text(
                                  "REGI",
                                  style: TextStyle(
                                    fontSize: 44,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            Positioned(
                              child: Align(
                                child: Container(
                                  padding: EdgeInsets.only(top: 40, left: 28),
                                  width: 130,
                                  child: Text(
                                    "STER",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            bottom: 20,
                            top: 60,
                          ),
                          child: CustomTextField(
                            icon: Icon(Icons.account_circle),
                            hint: "DISPLAY NAME",
                            validator: (input) =>
                                input!.isEmpty ? "*Required" : null,
                            onSaved: (input) => _displayName = input!,
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                            bottom: 20,
                          ),
                          child: CustomTextField(
                            icon: Icon(Icons.email),
                            hint: "EMAIL",
                            onSaved: (input) {
                              _email = input!;
                            },
                            validator: emailValidator,
                          )),
                      Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: CustomTextField(
                            icon: Icon(Icons.lock),
                            obsecure: true,
                            onSaved: (input) => _password = input!,
                            validator: (input) =>
                                input!.isEmpty ? "*Required" : null,
                            hint: "PASSWORD",
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: _loading
                            ? CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    primaryColor),
                              )
                            : Container(
                                child: filledButton(
                                    "REGISTER",
                                    Colors.white,
                                    primaryColor,
                                    primaryColor,
                                    Colors.white,
                                    _validateRegisterInput),
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                              ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
                    key: _formKey,
                  )),
                ],
              ),
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        );
      });
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            logo(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              child: Container(
                child: filledButton("LOGIN", primaryColor, Colors.white,
                    Colors.white, primaryColor, loginSheet),
                height: 50,
              ),
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: 20,
                  right: 20),
            ),
            Padding(
              child: Container(
                child: outlineButton(registerSheet),
                height: 50,
              ),
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            ),
            Expanded(
              child: Align(
                child: ClipPath(
                  child: Container(
                    color: Colors.white,
                    height: 300,
                  ),
                  clipper: BottomWaveClipper(),
                ),
                alignment: Alignment.center,
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ));
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height + 5);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
