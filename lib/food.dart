import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'vlp.dart';

class Food extends StatefulWidget{
  final User user;
  late String documentId;
  Food({required this.user, required this.documentId});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    CollectionReference receiver = FirebaseFirestore.instance.collection('receiver');
    
    CollectionReference donor = FirebaseFirestore.instance.collection('donor');

    return FutureBuilder<DocumentSnapshot>(
      future: receiver.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        //Data is output to the user
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            appBar: AppBar(
              title: Text("Welcome ${data['Name']}"),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: height*0.07,
                      width: width*0.6,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoadingPage()));
                        }, 
                        child: Column(
                          children: const <Widget>[
                            Text(
                              'Food type: Chole Bhature'
                            ),
                            Text(
                              'Quantity: 5'
                            )
                          ],
                          )
                        ),
                    )
                  ],
                ),
              ),
            )
          );
          
        }

        return Text("loading");
      },
    );    
  }
}