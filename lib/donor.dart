import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'vlp.dart';

class Donor extends StatefulWidget{
  const Donor({super.key});
  @override
  State<Donor> createState() => _DonorState();
}

class _DonorState extends State<Donor> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donor Details'),
      ),
      body: DonorForm(),
    );
  }
}

class DonorForm extends StatelessWidget{
  DonorForm({super.key});
  final _formKey = GlobalKey<FormState>();
  final name_ = TextEditingController();

  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    late String add, name, food, tow;
    late String phNum, fNum, quan;

    CollectionReference donor = FirebaseFirestore.instance.collection('donor');

    Future<void> addDonor() {
          return donor
              .add({
                'Name': name, 
                'Phone Number': phNum, 
                'Flat Number': fNum,
                'Tower': tow,
                'Locality': add,
                'Food items': food,
                'Quantity': quan,
              })
              .then((DocumentReference doc) => print("my document id from donor is: ${doc.id}"))
              .catchError((error) => print("Donor couldn't be added: $error"));
    }

    return Form(
      key: _formKey,
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 25,
              ),
              Center(
                child: SizedBox(
                  width: width*0.9,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (text){
                      name = text;
                    },
                  ),
                ),
              ),
        
              const SizedBox(
                height: 15,
              ),
              Center(
                child: SizedBox(
                  width: width*0.9,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Phone number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (text){
                      phNum = text;
                    },
                  ),
                ),
              ),
        
              const SizedBox(
                height: 15,
              ),
              Center(
                child: SizedBox(
                  width: width*0.9,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Flat number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (text){
                      fNum = text;
                    },
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              Center(
                child: SizedBox(
                  width: width*0.9,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Tower',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (text){
                      tow = text;
                    },
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              Center(
                child: SizedBox(
                  width: width*0.9,
                  child: TextFormField(
                    controller: name_,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Locality',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (text){
                      add = text;
                    },
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              Center(
                child: SizedBox(
                  width: width*0.9,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Food items',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (text){
                      food = text;
                    },
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              Center(
                child: SizedBox(
                  width: width*0.9,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Quantity',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (text){
                      quan = text;
                    },
                  ),
                ),
              ),

              const SizedBox(
                height: 50,
              ),
              
                ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                    addDonor();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LoadingPage())); //Food(add_: add, nam_: name)
                  },
                  child: const Text('Submit'),
                ),
              const SizedBox(
                height: 50,
              ),
            ]
          ),
        ),
      ),
    );
  }
}
