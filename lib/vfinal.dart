import 'package:flutter/material.dart';

class vlast extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Thank You for your support !!!! \n'
                'We look forward to working with you again',
                style: TextStyle(fontSize: 20)
                ),
            )
          ]
          ),
        )
    );
  }
}