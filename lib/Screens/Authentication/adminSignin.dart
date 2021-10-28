import 'package:flutter/material.dart';
import 'package:lavajava/Screens/Admin/AdminHome.dart';
import 'package:lavajava/Screens/Services/auth.dart';
import 'package:lavajava/Screens/home.dart';
import 'package:lavajava/Screens/warapperAdmin.dart';
import 'package:lavajava/Shared/constants.dart';
import 'package:lavajava/Shared/loading.dart';
import 'package:lavajava/Screens/Services/auth.dart';

import 'package:lavajava/Screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:lavajava/Models/User.dart';

class AdminSignIn extends StatefulWidget {
  @override
  _AdminSignInState createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String error = '';

  String email = '';
  String passward = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: <Widget>[
                Container(
                  height: 150.0,
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 20),
                  decoration: new BoxDecoration(
                      color: Colors.yellow[800],
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(80),
                      )),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 10,
                        color: Colors.yellow[800],
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, "Home");
                              },
                              color: Colors.yellow[800],
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            )),
                      ),
                      Center(
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            fontFamily: 'KaushanScript',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          'Hello Admin!!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.grey[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'Caveat',
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Add your details to login..',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.grey[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Caveat',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 35.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        TextFormField(
                          validator: (val) {
                            if (val.isEmpty ||
                                !val.contains('piyumikathisari@gmail.com')) {
                              return 'Please enter valid email';
                            } else {
                              return null;
                            }
                          },
                          // =>
                          //     val.isEmpty ? 'Enter an Email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                          style: TextStyle(color: Colors.white),
                          decoration:
                              textInputDecprations.copyWith(hintText: 'Email'),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          validator: (val) {
                            if (val.length < 6 || !val.contains('19971004')) {
                              return 'Passward is incorrect';
                            } else {
                              return null;
                            }
                          },
                          //  => val.length < 6
                          //     ? 'Incorrect Password'
                          //     : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => passward = val);
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: textInputDecprations.copyWith(
                              hintText: 'Password'),
                        ),
                        SizedBox(height: 25.0),
                        RaisedButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          color: Colors.yellow[800],
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, passward);

                              if (result == null) {
                                setState(() {
                                  error = 'Could not sign in';
                                  loading = false;
                                });
                              } else {
                                setState(() => loading = false);
                                Navigator.pushReplacementNamed(
                                    context, "AdminHome");
                              }
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
