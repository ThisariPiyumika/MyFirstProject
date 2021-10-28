//import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Product {
  String name;
  String image;
  String description;
  bool wishList;
  int price;
  String category;

  DocumentReference documentReference;

  Product({
    this.name,
    this.image,
    this.description,
    this.wishList,
    this.price,
    this.category,
  });

  //final CollectionReference product =
  //FirebaseFirestore.instance.collection('product');

  Product.fromMap(Map<String, dynamic> map, {this.documentReference}) {
    name = map['pname'];
    image = map['pimage'];
    description = map['pdescription'];
    wishList = map['wishList'];
    price = map['price'];
    category = map['pcategory'];
  }
  Product.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), documentReference: snapshot.reference);

  toJeson() {
    return {
      'pName': name,
      'pImage': image,
      'pDescription': description,
      'wishList': wishList,
      'price': price,
      'pcategory': category
    };
  }
}
