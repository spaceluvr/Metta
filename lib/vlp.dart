import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget{
  const LoadingPage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SpinKitPouringHourGlass(
              size: 100,
              color: Colors.blue,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Please wait while we connect you to a Volunteer"),
            ),
            SizedBox(height: 20),
            //Text('your id is: ${doc.id}')
          ],
        )
      )
    );
  }
}