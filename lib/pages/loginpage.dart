import 'package:flutter/material.dart';
import 'package:todo_app/pages/formpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      body: Container(
        height: Height,
        width: Width,
        color: Colors.amber,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    "https://icons.veryicon.com/png/System/Button%20UI%20-%20Requests%20%235/ToDo%20List.png",
                    height: 100,
                  ),
                  Column(
                    children: [Text("TODO APP"), Text("Create your Task")],
                  )
                ],
              ),
            ),
            Image.network(
              "https://icons.veryicon.com/png/o/miscellaneous/basic-linear-icon/sign-up-5.png",
              height: 150,
            ),
            form_page()
          ]),
        ),
      ),
      
    );
  }
}