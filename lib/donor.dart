import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Donor extends StatefulWidget{
  const Donor({super.key});
  @override
  State<Donor> createState() => _DonorState();
}

class _DonorState extends State<Donor> {
  @override
  /*void dispose(){
    donorController.dispose();
    super.dispose();
  }*/
  
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
  /*void dispose(){
    donorController.dispose();
    //super.dispose();
  }*/

  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    late String add, name;

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
                      labelText: 'Flat number',
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
                      labelText: 'Tower',
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
              /*ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LocationPage()));
                }, 
                child: const Text('Use Current Location')
                ),
        
              const SizedBox(
                height: 10,
              ),*/
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

/*class Food extends StatelessWidget{
  String add_, nam_;
  Food({super.key, required this.add_, required this.nam_});
  @override
  Widget build(BuildContext context){
    TextEditingController addr_ = TextEditingController(text: add_);
    TextEditingController name_ = TextEditingController(text: nam_);
    
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
      child: AppBar(
        title: Column(
          children: <Widget>[
            TextField(
              controller: name_,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              border: InputBorder.none,
              labelText: 'Hey',
              )
            ),
            Row(
              children: <Widget>[
                TextField(
                  controller: addr_,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  border: InputBorder.none,
                  //labelText: "address",
                  )
                ),
                ElevatedButton(
                  onPressed: (){}, 
                  child: const Text("change address")
                  )
              ]
            )
          ],
        )
      ),
      )
    );
  }
}*/

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
            )
          ],
        )
      )
    );
  }
}