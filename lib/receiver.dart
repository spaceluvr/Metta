import 'package:flutter/material.dart';

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

class ReceiverForm extends StatelessWidget{
  ReceiverForm({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height*0.25,
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
                    }
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
                    }
                  ),
                ),
              ),

              const SizedBox(
                height: 40,
              ),
        
                ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );                   
                    }
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Food())); 
                  },
                  child: const Text('Login'),
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

class Food extends StatefulWidget{
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(
        child: Text("Hola"),
        )
    );
  }
}