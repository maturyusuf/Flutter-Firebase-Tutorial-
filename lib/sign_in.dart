import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/members.dart';
import 'package:firebase_project/services/authentication.dart';
import 'package:firebase_project/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  String email ="";
  String password ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Center(
        child: Padding(

          padding: const EdgeInsets.all(60.0),
          child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.pink,
                              width: 2.0,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.pink,
                              width: 2.0,
                            ))),
                    validator: (value) {
                      return value!.isEmpty ? "Enter an email" : null;
                    },
                    onChanged: (value) {
                setState(() {
                  email = value;
                });
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                  
                    decoration: InputDecoration(
                        hintText: "Password",
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.pink,
                              width: 2.0,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.pink,
                              width: 2.0,
                            ))),
                    validator: (value) {
                      return value!.isEmpty ? "Enter a password" : null;
                    },
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
        
                  const SizedBox(
                    height: 20.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                        onPressed: () async {
                          
                          User? signedUser = await AuthService().signInEmailandPassword(email, password);
                          signedUser != null ? Navigator.push(context, MaterialPageRoute(builder: (context) => 
                          Members()
                          )) 
                          : print("Couldn'T sign in");
                        },
                        icon: Icon(Icons.send),
                        label: Text("Sign In")),
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
}