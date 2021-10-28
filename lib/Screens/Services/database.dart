import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //colloction reference
  final CollectionReference customer =
      FirebaseFirestore.instance.collection('customer');

  Future updateCustomerData(
      String cuid, String name, String address, String mobileNo) async {
    return await customer.doc(uid).set({
      'uid': cuid,
      'name': name,
      'address': address,
      'mobileNo': mobileNo,
    });
  }

  // //get customer stream
  // Stream<QuerySnapshot> get customers {
  //   return customerCollection.snapshots();
  // }
}
