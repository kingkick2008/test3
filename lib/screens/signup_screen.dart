import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';
import 'interface.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController locationTextController = TextEditingController();

  GlobalKey<FormState> formstatesignup = GlobalKey<FormState>();

  signup() {
    var formdata = formstatesignup.currentState;
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "S'inscrire",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
            key: formstatesignup,
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Nom et prénom", Icons.person_outline,
                      false, _userNameTextController, validglobal),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("localisation", Icons.person_outlined,
                      false, locationTextController, validglobal),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Email", Icons.person_outline, false,
                      _emailTextController, validglobal),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("mot de passe", Icons.lock_outlined, true,
                      _passwordTextController, validglobal),
                  const SizedBox(
                    height: 20,
                  ),
                  firebaseUIButton(context, "S'inscrire", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => inter()));
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailTextController.text,
                            password: _passwordTextController.text)
                        .then((value) {
                      print("Nouveau compte crée");
                    }).onError((error, stackTrace) {
                      print("Erreur ${error.toString()}");
                    });
                  })
                ],
              ),
            )),
          )),
    );
  }
}
