import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'vfinal.dart';

class Volunteer extends StatefulWidget{
  const Volunteer({super.key});
  @override
  State<Volunteer> createState() => _VolunteerState();
}

class _VolunteerState extends State<Volunteer> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: VolunteerForm(),
    );
  }
}

class VolunteerForm extends StatefulWidget{
  VolunteerForm({super.key});

  @override
  State<VolunteerForm> createState() => _VolunteerFormState();
}

class _VolunteerFormState extends State<VolunteerForm> {
  final _formKey = GlobalKey<FormState>();
  final _num = TextEditingController();

  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    late String name, vType;
    late String phNum, vNum;

    CollectionReference volunteer = FirebaseFirestore.instance.collection('volunteer');

    Future<void> addVolunteer() {
          return volunteer
              .add({
                'Name': name, 
                'Phone Number': phNum, 
                'Vehicle Type': vType,
                'Vehicle Number': vNum,
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
                    controller: _num,
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
                      labelText: 'Vehicle Type',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (text){
                      vType = text;
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
                      labelText: 'Vehicle Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (text){
                      vNum = text;
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
                    addVolunteer();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> delivery(documentId: _num.text)));
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

class delivery extends StatefulWidget{
  @override
  late String documentId;
  delivery({required this.documentId});

  @override
  State<delivery> createState() => _deliveryState();
}

class _deliveryState extends State<delivery> {
  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    CollectionReference receiver = FirebaseFirestore.instance.collection('receiver');
    
    CollectionReference donor = FirebaseFirestore.instance.collection('donor');

    
          return Scaffold(
            appBar: AppBar(
              title: Text("Welcome"),
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
                      height: height*0.09,
                      width: width*0.6,
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> vlast()));
                        }, 
                        child: Center(
                          child: Column(
                            children: const <Widget>[
                              Text(
                                'From: Amrapali Silicon City, Sector 76, Noida'
                              ),
                              Text(
                                'To: Barola, sector 48, Noida'
                              )
                            ],
                            ),
                        )
                        ),
                    )
                  ],
                ),
              ),
            )
          );
          
        } 
      }
