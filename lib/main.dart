import 'package:flutter/material.dart';
import 'package:lavajava/Screens/Admin/AdminHome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lavajava/Screens/Authentication/Register.dart';
import 'package:lavajava/Screens/Authentication/adminSignin.dart';
import 'package:lavajava/Screens/Authentication/signin.dart';
import 'package:lavajava/Screens/Customer/CustomerHome.dart';
import 'package:lavajava/Screens/Customer/menu.dart';
import 'package:lavajava/Screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        //StreamProvider<User>.value(
        //value: AuthServices().user,
        // child: MaterialApp(
        home: Home(),
        routes: <String, WidgetBuilder>{
          "Home": (BuildContext context) => Home(),
          "CustomerLogin": (BuildContext context) => SignIn(),
          "CustomerRegister": (BuildContext context) => Register(),
          "CustomerHome": (BuildContext context) => CustomerHome(),
          "AdminLogin": (BuildContext context) => AdminSignIn(),
          "AdminHome": (BuildContext context) => AdminHome(),
          "Menu": (BuildContext context) => FoodMenu(),
        });
  }
}
