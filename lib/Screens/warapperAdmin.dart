import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lavajava/Screens/Admin/AdminHome.dart';
import 'package:lavajava/Screens/Authentication/authentication.dart';
import 'package:lavajava/Screens/Authentication/authenticationAdmin.dart';
import 'package:lavajava/Screens/Customer/CustomerHome.dart';
import 'package:provider/provider.dart';
import 'package:lavajava/Models/User.dart';

class WrapperAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserLV>(context);

    if (user == null) {
      return AuthenticationAdmin();
    } else {
      return AdminHome();
    }
  }
}
