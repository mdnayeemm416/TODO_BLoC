import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TaskAddWidget extends StatefulWidget {
  const TaskAddWidget({super.key});

  @override
  State<TaskAddWidget> createState() => _TaskAddWidgetState();
}

class _TaskAddWidgetState extends State<TaskAddWidget> {
  final TextEditingController Titlecontroller = TextEditingController();
  final TextEditingController Descriptioncontroller = TextEditingController();

  Addtask() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = await auth.currentUser;
    String UID = user!.uid;
    String time = DateTime.now().toString();
    FirebaseFirestore.instance
        .collection("Task List")
        .doc(UID)
        .collection("Task")
        .doc(time)
        .set({
      "Title": Titlecontroller.text,
      "Description": Descriptioncontroller.text,
      "Time": time
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Image.network(
                "https://cdn2.iconfinder.com/data/icons/hand-drawn-10/135/132-1024.png",
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: double.maxFinite,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  children: [
                    TextField(
                      controller: Titlecontroller,
                      cursorColor: Colors.amber,
                      decoration: InputDecoration(
                          label: Text("Title"),
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Title",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: Descriptioncontroller,
                      maxLines: 3,
                      cursorColor: Colors.amber,
                      decoration: InputDecoration(
                          label: Text("Tille Description"),
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: "Tille Description",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                          Addtask();
                          Navigator.pop(context);
                        },
                        child: Text("Add Task"),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            primary: Theme.of(context).primaryColor),
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
