import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(children: <Widget>[
          Container(
            height: 400.0,
            width: double.infinity,
            color: Colors.yellow[800],
            child: Container(
              height: 400.0,
              width: double.infinity,
              // color: Colors.yellow[800],
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      //colorFilter: ColorFilter.mode(
                      //Colors.black.withOpacity(0.5), BlendMode.darken),
                      //colo
                      image: AssetImage(
                        "asset/Untitled.png",
                      )),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                  )),
            ),
          ),
          Container(
            height: 50.0,
            width: double.infinity,
            decoration: new BoxDecoration(
                color: Colors.yellow[800],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                )),
            child: Center(
              child: Text(
                "Have an amaizing food experiance with fast delivery to your destination.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'KaushanScript',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            width: double.infinity,
            height: 65.0,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: RaisedButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, "CustomerLogin");
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.yellow[800],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Singin to Lavajava',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 100.0,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: RaisedButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, "CustomerRegister");
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.yellow[800])),
                      color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'New Customer?',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.yellow[800],
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.yellow[800],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.yellow[800],
        focusColor: Colors.yellow[900],
        onPressed: () {
          Navigator.pushReplacementNamed(context, "AdminLogin");
        },
        label: Text(
          'Admin',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Caveat',
          ),
        ),
        icon: Icon(
          Icons.person,
          color: Colors.black,
        ),
      ),
    );
  }
}
