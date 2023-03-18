import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Donor()));
                  },
                  child: const Text('Donor'),
                ),
              ),

              SizedBox(
                height: height*0.05,
              ),
              
              SizedBox(
                height: height*0.15,
                width: width*0.4,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Volunteer()));
                  },
                  child: const Text('Volunteer'),
                ),
              ),

              SizedBox(
                height: height*0.05,
              ),
              
              SizedBox(
                height: height*0.15,
                width: width*0.4,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Receiver()));
                  },
                  child: const Text('Receiver'),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

class Donor extends StatefulWidget{
  const Donor({super.key});
  @override
  State<Donor> createState() => _DonorState();
}

class _DonorState extends State<Donor> {
  final donorController = TextEditingController();
  @override
  void dispose(){
    donorController.dispose();
    super.dispose();
  }
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
  final donorController = TextEditingController();
  void dispose(){
    donorController.dispose();
    //super.dispose();
  }

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
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Locality',
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

class VolunteerForm extends StatelessWidget{
  VolunteerForm({super.key});
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
                      labelText: 'Vehicle Number',
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
                height: 50,
              ),
              
                ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
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
