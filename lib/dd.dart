import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> getData() async {
        final db = FirebaseFirestore.instance;
        var result=await db.collection('donor').get();
        result.docs.forEach((res) {print(dd(res.id));});}

class dd extends StatelessWidget {
  final String documentId;

  dd(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference donor = FirebaseFirestore.instance.collection('donor');

    return FutureBuilder<DocumentSnapshot>(
      //Fetching data from the documentId specified of the student
      future: donor.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        

        //Error Handling conditions
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        //Data is output to the user
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return data['Name'];
        }

        return Text("loading");
      },
    );
  }
}