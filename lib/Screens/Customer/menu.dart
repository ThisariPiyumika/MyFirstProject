import 'package:flutter/material.dart';
import 'package:lavajava/Widgets/Categories.dart';
import 'package:lavajava/Widgets/CustomText.dart';
import 'package:lavajava/Widgets/FeaturedProducts.dart';
import 'package:lavajava/Widgets/buttonNevigationIcons.dart';

class FoodMenu extends StatefulWidget {
  @override
  _FoodMenuState createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'What would you like to eat?',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'KaushanScript',
                    color: Colors.orange,
                  ),
                ),
              ),
              Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.black, boxShadow: [
                BoxShadow(
                    color: Colors.white38, offset: Offset(1, 1), blurRadius: 4)
              ]),
              child: ListTile(
                leading: Icon(Icons.search, color: Colors.red[100]),
                title: TextField(
                    decoration: InputDecoration(
                        hintText: 'Find food you love',
                        border: InputBorder.none)),
                trailing: Icon(
                  Icons.filter_list,
                  color: Colors.red[100],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Categories(),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              text: 'Featured',
              size: 19,
              color: Colors.grey[400],
              family: "",
            ),
          ),
          Featured(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              text: 'Popular',
              size: 19,
              color: Colors.grey[400],
              family: "",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250.0,
                    width: double.infinity,
                    color: Colors.black,
                    child: Container(
                      height: 250.0,
                      width: double.infinity,
                      // color: Colors.yellow[800],
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            // colorFilter: ColorFilter.mode(
                            //     Colors.black.withOpacity(0.75), BlendMode.darken),
                            image: AssetImage(
                              "asset/sub-2.jpg",
                            ),
                          )),
                    ),
                  ),
                ),
                Positioned(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(50)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.05),
                              Colors.black.withOpacity(0.025),
                            ])),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.pink,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.favorite,
                                size: 15,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Chicken Burgers \n',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700)),
                            TextSpan(
                                text: 'by ',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: 'LavaJava',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                          ], style: TextStyle(color: Colors.black)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Rs.500 \n',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w300)),
                          ], style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      )),
      bottomNavigationBar: Container(
        height: 55,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 7, 5),
                child: BottomNavIcon(
                  icon: Icons.home,
                  name: 'Home',
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(7, 5, 7, 5),
                child: BottomNavIcon(
                  icon: Icons.shopping_cart_outlined,
                  name: 'Cart',
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(7, 5, 30, 5),
                child: BottomNavIcon(
                  icon: Icons.person_add_outlined,
                  name: 'You',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
