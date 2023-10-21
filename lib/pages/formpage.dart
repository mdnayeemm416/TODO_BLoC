import 'package:flutter/material.dart';
import 'package:todo_app/function/FirebaseFunction.dart';

class form_page extends StatefulWidget {
  const form_page({super.key});

  @override
  State<form_page> createState() => _form_pageState();
}

class _form_pageState extends State<form_page> {
  final _formkey = GlobalKey<FormState>();
  String Username = "";
  var password = "";
  var email = "";

  bool Islogin = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    !Islogin
                        ? TextFormField(
                            key: ValueKey("User Name"),
                            validator: (value) {
                              if (value.toString().length <= 3) {
                                return "Please insert a proper user name";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (newValue) {
                              Username = newValue!;
                            },
                            decoration: InputDecoration(
                                hintText: "User Name",
                                icon: Icon(Icons.person),
                                iconColor: Colors.red,
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.red)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.red))))
                        : Container(),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        key: ValueKey("Email"),
                        validator: (value) {
                          if (!(value.toString().contains("@"))) {
                            return "Please insert a proper Wmail";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (newValue) {
                          email = newValue!;
                        },
                        decoration: InputDecoration(
                            hintText: "Email",
                            icon: Icon(Icons.email_rounded),
                            iconColor: Colors.red,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.red)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.red)))),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        key: ValueKey("password"),
                        validator: (value) {
                          if (value.toString().length <= 4) {
                            return "Please insert a proper password";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (newValue) {
                          password = newValue!;
                        },
                        decoration: InputDecoration(
                            hintText: "Password",
                            icon: Icon(Icons.password),
                            iconColor: Colors.red,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.red)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.red)))),
                  ],
                ),
              ),
            )),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                _formkey.currentState!.save();
                Islogin ? login(email, password,context) : signUp(email, password,Username,context);
              }
            },
            child: Text("Sign Up"),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                textStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
        TextButton(
            onPressed: () {
              setState(() {
                Islogin = !Islogin;
              });
            },
            child: Text("Already Have An Account| Sing In!"))
      ],
    );
  }
}
