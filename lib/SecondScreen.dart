import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
   final controlltarea = TextEditingController();
  final controllertrabajo = TextEditingController();
  bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
    
    body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Welcome on Second Screen",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child:  FloatingActionButton(
              onPressed: () {
                  Navigator.pushNamed(context, '/homeScreen');
              },
               child: const Icon(Icons.add)
              
            ),
          ),
        ],
      ),
    );



  }
}
