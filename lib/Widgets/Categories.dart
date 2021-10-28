import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lavajava/Widgets/CustomText.dart';
import 'package:lavajava/Models/Category.dart';

List<Category> categoriesList = [
  Category(name: 'Meals', image: 'rice.jpg'),
  Category(name: 'Fast Food', image: 'burger.jpg'),
  //Category(name: 'Meals', image: 'rice.jpg'),
  Category(name: 'Desserts', image: 'nasi.jpg'),
  Category(name: 'Beverages', image: 'hotdog.jpg'),
];

class Categories extends StatelessWidget {
  //const Categories({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: Offset(4, 6),
                          blurRadius: 20)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    height: 100,

                    width: 150,
                    // color: Colors.yellow[800],
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.50), BlendMode.darken),
                          image: AssetImage(
                            "asset/${categoriesList[index].image}",
                          ),
                        )),
                    child: Center(
                      child: CustomText(
                        text: categoriesList[index].name,
                        color: Colors.white,
                        size: 23,
                        weight: FontWeight.w300,
                        family: '',
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
