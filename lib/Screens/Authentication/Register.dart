import 'package:flutter/material.dart';
import 'package:lavajava/Screens/Authentication/signin.dart';
import 'package:lavajava/Screens/Services/auth.dart';
import 'package:lavajava/Shared/constants.dart';
import 'package:lavajava/Shared/loading.dart';
import 'package:lavajava/Screens/home.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String passward = '';
  String confirmPW = '';
  String error = '';
  String name = '';
  String address = '';
  String mobileNo = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.black,
            body: ListView(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                        height: 150.0,
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 20),
                        decoration: new BoxDecoration(
                            color: Colors.yellow[800],
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(80),
                            )),
                        child: Column(children: <Widget>[
                          Container(
                            height: 10,
                            color: Colors.yellow[800],
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, "Home");
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
                              "Sign Up",
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
                              'Hello New Customer!!',
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
                              'Add your details to register.',
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
                        ])),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 50.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 30.0),
                            TextFormField(
                                validator: (val) =>
                                    val.isEmpty ? 'Name cannot be empty' : null,
                                onChanged: (val) {
                                  setState(() => name = val);
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: textInputDecprations.copyWith(
                                    hintText: 'Name')),
                            SizedBox(height: 25.0),
                            TextFormField(
                                validator: (val) => val.isEmpty
                                    ? 'Address cannot be empty'
                                    : null,
                                onChanged: (val) {
                                  setState(() => address = val);
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: textInputDecprations.copyWith(
                                    hintText: 'Address')),
                            SizedBox(height: 25.0),
                            TextFormField(
                                validator: (val) => val.isEmpty
                                    ? 'Moblie Number cannot be empty'
                                    : null,
                                onChanged: (val) {
                                  setState(() => mobileNo = val);
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: textInputDecprations.copyWith(
                                    hintText: 'Mobile Number')),
                            SizedBox(height: 25.0),
                            TextFormField(
                                validator: (val) => val.isEmpty
                                    ? 'Email cannot be empty'
                                    : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: textInputDecprations.copyWith(
                                    hintText: 'Email')),
                            SizedBox(height: 25.0),
                            TextFormField(
                              validator: (val) => val.length < 6
                                  ? 'Enter an password 6+ chars long'
                                  : null,
                              obscureText: true,
                              onChanged: (val) {
                                setState(() => passward = val);
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: textInputDecprations.copyWith(
                                  hintText: 'Password'),
                            ),
                            SizedBox(height: 25.0),
                            TextFormField(
                              validator: (val) => val != passward
                                  ? 'Enter correct passward'
                                  : null,
                              obscureText: true,
                              onChanged: (val) {
                                setState(() => confirmPW = val);
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: textInputDecprations.copyWith(
                                  hintText: 'Confirm Password'),
                            ),
                            SizedBox(height: 30.0),
                            RaisedButton(
                                color: Colors.yellow[800],
                                child: Text(
                                  'Register',
                                  //style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() => loading = true);

                                    dynamic result = await _auth
                                        .registerWithEmailAndPassword(email,
                                            passward, name, address, mobileNo);

                                    if (result == null) {
                                      setState(() {
                                        error = 'Try again';
                                        loading = false;
                                      });
                                    } else {
                                      Navigator.pushReplacementNamed(
                                          context, "CustomerLogin");
                                    }
                                  }
                                }),
                            SizedBox(height: 12.0),
                            Text(
                              error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
                            ),
                            SizedBox(height: 12.0),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Already registered?',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontFamily: 'Caveat'),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, "CustomerLogin");
                                      },
                                      child: Text(
                                        'Signin',
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Caveat'),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
