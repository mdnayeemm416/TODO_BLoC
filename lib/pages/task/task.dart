import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/function/FirebaseFunction.dart';
import 'package:todo_app/pages/task/bloc/task_bloc.dart';
import 'package:todo_app/pages/task_description/taskadd.dart';

class Task_page extends StatefulWidget {
  const Task_page({super.key});

  @override
  State<Task_page> createState() => _Task_pageState();
}

class _Task_pageState extends State<Task_page> {
  final TaskBloc taskBloc = TaskBloc();
  String UID = '';
  @override
  void initState() {
    taskBloc.add(TaskInitialEvent());

    GetUid();
    super.initState();
  }

  GetUid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = await auth.currentUser;
    String Uid = user!.uid;

    setState(() {
      UID = Uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Container(
                color: Colors.red,
              )),
              ListTile(
                title: const Text("Signout"),
                onTap: () {
                  signout();
                },
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Center(child: Text("Task")),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          taskBloc.add(TaskAddButtonClickedEvent());
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<TaskBloc, TaskState>(
        bloc: taskBloc,
        buildWhen: (previous, current) => current is! TaskActionState,
        listenWhen: (previous, current) => current is TaskActionState,
        listener: (context, state) {
          if (state is TaskAddButtonClickedState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TaskAddWidget()));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case TaskLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case TaskSuccessState:
              return Container(
                height: 100,
                width: double.maxFinite,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Task List")
                      .doc(UID)
                      .collection("Task")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      final doc = snapshot.data!.docs;
                      return ListView.builder(
                          itemCount: doc.length,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Text(doc[index]["Title"]),
                            );
                          });
                    }
                  },
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
