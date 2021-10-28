import 'package:flutter/material.dart';
import 'package:lavajava/Screens/Authentication/adminSignin.dart';

class AuthenticationAdmin extends StatefulWidget {
  @override
  _AuthenticationAdminState createState() => _AuthenticationAdminState();
}

class _AuthenticationAdminState extends State<AuthenticationAdmin> {
  @override
  Widget build(BuildContext context) {
    return AdminSignIn();
  }
}
