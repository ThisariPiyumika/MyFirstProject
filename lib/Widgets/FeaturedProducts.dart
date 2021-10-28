import 'package:flutter/material.dart';
import 'package:lavajava/Widgets/CustomText.dart';
import 'package:lavajava/Models/Products.dart';

List<Product> productsList = [
  Product(name: 'Meals', image: 'biriyani.jpg', wishList: true, price: 150),
  Product(name: 'Fast Food', image: 'burger.jpg', wishList: true, price: 150),
  Product(name: 'Meals', image: 'rice.jpg', wishList: false, price: 150),
  Product(name: 'Desserts', image: 'nasi.jpg', wishList: false, price: 150),
  Product(name: 'Beverages', image: 'hotdog.jpg', wishList: true, price: 150),
];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(12, 14, 16, 12),
              child: Container(
                height: 260,
                width: 220,
                decoration: BoxDecoration(color: Colors.black, boxShadow: [
                  BoxShadow(
                      color: Colors.white38,
                      offset: Offset(1, 1),
                      blurRadius: 4)
                ]),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 160.0,
                        width: double.infinity,
                        // color: Colors.yellow[800],
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              // colorFilter: ColorFilter.mode(
                              //     Colors.black.withOpacity(0.75), BlendMode.darken),
                              image: AssetImage(
                                "asset/${productsList[index].image}",
                              ),
                            )),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CustomText(
                            text: productsList[index].name,
                            size: 16,
                            color: Colors.orange[100],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white38,
                                      offset: Offset(1, 1),
                                      blurRadius: 4)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: productsList[index].wishList
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 18,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                      size: 18,
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                    //SizedBox(height: 5),
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            CustomText(
                              text:
                                  'Rs.${productsList[index].price.toString()}',
                              size: 18,
                              color: Colors.orange,
                              weight: FontWeight.bold,
                              //family: "",
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
