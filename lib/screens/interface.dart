
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rassurant/screens/signin_screen.dart';

import '../utils/color_utils.dart';

class inter extends StatefulWidget {
  const inter({Key? key}) : super(key: key);

  @override
  _interState createState() => _interState();
}

class _interState extends State<inter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Rassurant",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 20,
        actions: [
          IconButton(icon : Icon(Icons.logout),
           onPressed: () {
           FirebaseAuth.instance.signOut().then((value) {
              print("Sortir"); 
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            });
          },

          ),
        ],
        
      ),
      

          body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("FFFFFF"),
            hexStringToColor("FFFFFF")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),

          ))),    
    );
  }
}


