import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: height*0.15,
                width: width*0.4,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Donor'),
                ),
              ),

              SizedBox(
                height: height*0.05,
              ),
              
              SizedBox(
                height: height*0.15,
                width: width*0.4,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Volunteer'),
                ),
              ),

              SizedBox(
                height: height*0.05,
              ),
              
              SizedBox(
                height: height*0.15,
                width: width*0.4,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Receiver'),
                ),
              ),
            ],
          ),
        ),
      );
  }
}