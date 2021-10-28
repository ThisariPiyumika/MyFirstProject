import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:lavajava/Models/Products.dart';
import 'package:lavajava/Widgets/CustomText.dart';

class ProductFirebaseDemo extends StatefulWidget {
  ProductFirebaseDemo() : super();

  //final String appTitle = "Product DB";

  @override
  _ProductFirebaseDemoState createState() => _ProductFirebaseDemoState();
}

class _ProductFirebaseDemoState extends State<ProductFirebaseDemo> {
  TextEditingController productNameContoller = TextEditingController();
  TextEditingController productDescriptionContoller = TextEditingController();
  TextEditingController productPriceContoller = TextEditingController();
  TextEditingController productCategoryContoller = TextEditingController();

  bool isEditing = false;
  bool texiFieldVisibility = false;

  String firestoreCollections = "product";

  Product currentProduct;

  getAllProduct() {
    return FirebaseFirestore.instance
        .collection(firestoreCollections)
        .snapshots();
  }

  addProduct() {
    Product product = Product(
      name: productCategoryContoller.text,
      description: productDescriptionContoller.text,
      price: int.parse(productPriceContoller.text),
      category: productDescriptionContoller.text,
      wishList: false,
    );

    try {
      FirebaseFirestore.instance
          .runTransaction((Transaction transaction) async {
        await FirebaseFirestore.instance
            .collection(firestoreCollections)
            .doc()
            .set(product.toJeson());
      });
    } catch (e) {
      print(e.toString());
    }
  }

  updateProcuct(Product product, String name, String description, int price,
      category, bool wishlist, String image) {
    try {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        await transaction.update(product.documentReference, {
          'pname': name,
          'pimage': image,
          'pdescription': description,
          'wishList': wishlist,
          'price': price,
          'pcategory': category
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  updateIfEditing() {
    updateProcuct(
        currentProduct,
        productNameContoller.text,
        productDescriptionContoller.text,
        int.parse(productPriceContoller.text),
        productCategoryContoller.text,
        false,
        "image");

    setState(() {
      isEditing = false;
    });
  }

  deleteProduct(Product product) {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      await transaction.delete(product.documentReference);
    });
  }

  Widget buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getAllProduct(),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }
        if (snapshot.hasData) {
          print("Document -> ${snapshot.data.docs.length}");
          return buildList(context, snapshot.data.docs);
        }
      },
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => listItemBuild(context, data)).toList(),
    );
  }

  Widget listItemBuild(BuildContext context, DocumentSnapshot data) {
    final product = Product.fromSnapshot(data);
    return Padding(
      key: ValueKey(product.name),
      padding: EdgeInsets.symmetric(horizontal: 1, vertical: 19),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
          child: ListTile(
            title: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CustomText(text: product.name),
                    Divider(),
                    CustomText(
                      text: product.description,
                      family: "",
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    CustomText(text: "Rs:${product.price}")
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 50.0,
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
                              "asset/${product.image}",
                            ),
                          )),
                    ),
                    // Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: RaisedButton(
                    //       onPressed: () {
                    //         // Navigator.pushReplacementNamed(
                    //         //     context, "Home");
                    //       },
                    //       color: Colors.yellow[800],
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: <Widget>[
                    //           Icon(
                    //             Icons.delete,
                    //             color: Colors.red,
                    //           )
                    //         ],
                    //       ),
                    //     )),
                  ],
                )
              ],
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: deleteProduct(product),
            ),
            onTap: setUpdateUI(product),
          ),
        ),
      ),
    );
  }

  setUpdateUI(Product product) {
    productNameContoller.text = product.name;
    productDescriptionContoller.text = product.description;
    productPriceContoller.text = product.category;
    productPriceContoller.text = product.price.toString();

    setState(() {
      texiFieldVisibility = true;
      isEditing = true;
      currentProduct = product;
    });
  }

  button() {
    return SizedBox(
      width: double.infinity,
      child: OutlineButton(
        child: Text(isEditing ? "UPDATE" : "ADD"),
        onPressed: () {
          if (isEditing == true) {
            updateIfEditing();
          } else {
            addProduct();
          }

          setState(() {
            texiFieldVisibility = false;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
