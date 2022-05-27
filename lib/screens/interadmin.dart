
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rassurant/screens/signin_screen.dart';

import '../utils/color_utils.dart';

class interadmin extends StatefulWidget {
  const interadmin({Key? key}) : super(key: key);

  @override
  _interadminState createState() => _interadminState();
}

class _interadminState extends State<interadmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: const Text(
          "Interface d'Administrateur",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
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
