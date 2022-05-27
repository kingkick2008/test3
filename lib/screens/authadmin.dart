//import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:rassurant/screens/interface.dart';
import 'package:rassurant/screens/reset_password.dart';
import 'package:rassurant/screens/signup_screen.dart';
import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';
import 'interadmin.dart';

class authadmin extends StatefulWidget {
  const authadmin({Key? key}) : super(key: key);

  @override
  _authadminState createState() => _authadminState();
}

class _authadminState extends State<authadmin> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  GlobalKey<FormState> formstatesauthadmin = GlobalKey<FormState>();

  authadmin() {
    var formdata = formstatesauthadmin.currentState;
    if (formdata!.validate()) {
      print("valid");
    } else {
      print("not valid");
    }
  }

  String validglobal(String val) {
    if (val.isEmpty) {
      return "il faut ecrire quelque chose";
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Form(
          key: formstatesauthadmin,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/images/admin.png"),
                  const SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Email", Icons.person_outline, false,
                      _emailTextController, validglobal),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Mot de passe", Icons.lock_outline, true,
                      _passwordTextController, validglobal),
                  const SizedBox(
                    height: 5,
                  ),
                  firebaseUIButton(
                      context, "Accéder à l'interface d'Administrateur", () {
                    /**  FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)*/
                    // .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => interadmin()));
                    // }).onError((error, stackTrace) {
                    //  print("Error ${error.toString()}");
                    // }),
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
