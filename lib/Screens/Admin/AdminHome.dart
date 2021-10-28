import 'package:flutter/material.dart';
import 'package:lavajava/Screens/Services/auth.dart';
import 'package:lavajava/Screens/home.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final AuthServices _auth = AuthServices();

  bool isMenu = false;
  bool isFeedback = false;

  Future<bool> logoutDialog() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: Text('Log out?'),
        content: Text('Are you sure you want to log out?'),
        actions: [
          FlatButton(
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacementNamed(context, "Home");
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text('Yes'),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('No'),
          )
        ],
      ),
    );
  }

  Widget Menu() {
    isMenu = true;
    return ListView(
      children: <Widget>[],
    );
  }

  Widget Order() {
    return ListView(
      children: <Widget>[],
    );
  }

  Widget Feedback() {
    isFeedback = true;
    return ListView(
      children: <Widget>[],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text(
              'LavaJava',
              style: TextStyle(
                fontFamily: 'KaushanScript',
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.yellow[800],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: Text(
                  'logout',
                  style: TextStyle(
                    fontFamily: 'KaushanScript',
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  logoutDialog();
                  // async {
                  //   await _auth.signOut();
                  //   Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  //     return Home();
                  //   }));
                },
              )
            ],
            bottom: TabBar(
              indicatorColor: Colors.red[900],
              labelStyle: TextStyle(
                fontFamily: 'KaushanScript',
                fontWeight: FontWeight.bold,
              ),
              labelColor: Colors.red[900],
              unselectedLabelColor: Colors.black,
              //TextStyle(fontFamily: 'KaushanScript'),
              tabs: [
                Tab(text: 'Menu'),
                Tab(text: 'Order'),
                Tab(text: 'Feedback')
              ],
            ),
          ),
          body: TabBarView(
            children: [Menu(), Order(), Feedback()],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () {
              if (isMenu == true) {
                Order();
              }
              if (isFeedback == true) {}
            },
            child: Icon(Icons.add),
          ),
        ));
  }
}
