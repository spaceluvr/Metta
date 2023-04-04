import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'food.dart';


class Receiver extends StatefulWidget{
  const Receiver({super.key});
  @override
  State<Receiver> createState() => _ReceiverState();
}

class _ReceiverState extends State<Receiver> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: ReceiverForm(),
    );
  }
}

class ReceiverForm extends StatefulWidget{
  ReceiverForm({super.key});

  @override
  State<ReceiverForm> createState() => _ReceiverFormState();
}

class _ReceiverFormState extends State<ReceiverForm> {
  final _formKey = GlobalKey<FormState>();

  final _num = TextEditingController();

  final _otp = TextEditingController();

  //final rFood = Food(user: result.user!, documentId: _num.text,);

  String userNumber = '';

  FirebaseAuth auth = FirebaseAuth.instance;

  var otpFieldVisibility = false;

  var receivedID = '';

  void verifyUserPhoneNumber() {
    auth.verifyPhoneNumber(
      phoneNumber: userNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then(
              (UserCredential result){
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) => Food(user: result.user!, documentId: _num.text)
                  ));
                }).catchError((e){
                  print(e);
              }
            );
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        receivedID = verificationId;
        otpFieldVisibility = true;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyOTPCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: receivedID,
      smsCode: _otp.text,
    );
    await auth
        .signInWithCredential(credential)
        .then((UserCredential result){
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Food(user: result.user!, documentId: _num.text)
            ));
          }).catchError((e){
            print(e);
        }
        );
  }

  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Phone Authentication',
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IntlPhoneField(
                controller: _num,
                initialCountryCode: 'IN',
                decoration: const InputDecoration(
                  hintText: 'Phone Number',
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
                onChanged: (val) {
                  userNumber = val.completeNumber;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Visibility(
                visible: otpFieldVisibility,
                child: TextField(
                  controller: _otp,
                  decoration: const InputDecoration(
                    hintText: 'OTP Code',
                    labelText: 'OTP',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (otpFieldVisibility) {
                  verifyOTPCode();
                } else {
                  verifyUserPhoneNumber();
                }
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Text(
                otpFieldVisibility ? 'Login' : 'Verify',
              ),
            )
          ],
        ),
      ),
    );
  }
}


/*class Food extends StatefulWidget{
  final User user;
  late String documentId;
  Food({required this.user, required this.documentId});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context){
    CollectionReference receiver = FirebaseFirestore.instance.collection('receiver');
    
    CollectionReference donor = FirebaseFirestore.instance.collection('donor');

    Future<void> getData() async {
        final db = FirebaseFirestore.instance;
        var result=await db.collection('donor').get();
        result.docs.forEach((res) {
          FutureBuilder<DocumentSnapshot>(
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
                          ElevatedButton(
                            onPressed: (){
                              getData();
                            }, 
                            child: Text('We will win')
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
        }); //print(res.id); to get all the ids
    }
    
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
                    ElevatedButton(
                      onPressed: (){
                        getData();
                      }, 
                      child: Text('We will win')
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
    
    /*return Scaffold (
      appBar: AppBar(
        title: Text('Welcome ${data['Name']}'),
      ),
      );*/
    
    /*return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text("You are Logged in succesfully", style: TextStyle(color: Colors.lightBlue, fontSize: 32),),
            const SizedBox(height: 16,),
            Text("${user.phoneNumber}", style: const TextStyle(color: Colors.grey, ),),
          ],
        ),
      ),

    );*/
  }
}*/