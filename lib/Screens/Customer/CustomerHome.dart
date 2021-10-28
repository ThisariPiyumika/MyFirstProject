import 'package:flutter/material.dart';
import 'package:lavajava/Screens/Customer/menu.dart';
import 'package:lavajava/Screens/Services/auth.dart';
import 'package:lavajava/Screens/home.dart';

class CustomerHome extends StatelessWidget {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            height: 750.0,
            width: double.infinity,
            color: Colors.black,
            child: Container(
              height: 750.0,
              width: double.infinity,
              // color: Colors.yellow[800],
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.75), BlendMode.darken),
                image: AssetImage(
                  "asset/lavajava.jpg",
                ),
              )),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: 500,
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 450),
                          child: Text(
                            "Find Food You Love",
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
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 50),
                        child: Text(
                          "Have an amaizing food experiance with fast delivery to your destination.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: 'Caveat',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "Menu");
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'KaushanScript'),
                            )),
                        Icon(
                          Icons.arrow_forward,
                          size: 20,
                          color: Colors.orange,
                        )
                      ],
                    ),
                  ),
                  // FlatButton.icon(
                  //   icon: Icon(Icons.person),
                  //   label: Text('logout'),
                  //   onPressed: () async {
                  //     await _auth.signOut();
                  //     Navigator.of(context)
                  //         .push(MaterialPageRoute(builder: (_) {
                  //       return Home();
                  //     }));
                  //   },
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
