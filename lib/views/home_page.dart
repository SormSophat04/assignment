import 'dart:developer';

import 'package:ass_midterm_one/components/task_widget.dart';
import 'package:ass_midterm_one/controller/task_service.dart';
import 'package:ass_midterm_one/views/create_task_page.dart';
import 'package:ass_midterm_one/views/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controller/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authService = AuthService();
  final taskService = TaskService();

  String userName = "Dear";

  void fetchUserName() async {
    String fetchUserName = await authService.getUserName();
    setState(() {
      userName = fetchUserName;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  void logOut() {
    authService.logOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                // color: Colors.amber,
                image: DecorationImage(
                  alignment: Alignment(-1, 0),
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/icons/bgf.png"),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello $userName,",
                          style: const TextStyle(fontSize: 26),
                        ),
                        const Text(
                          "You have work today",
                          style: TextStyle(
                              fontFamily: "inter", color: Colors.grey),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      ),
                      child: const Hero(
                        tag: "users_tag",
                        child: Image(
                          image: AssetImage(
                            "assets/images/users.png",
                          ),
                          width: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Category=====================================
            Container(
              width: double.infinity,
              height: 250,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: GridView(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.blueAccent.shade200.withOpacity(0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.5)),
                            child: Icon(
                              Icons.folder_copy_outlined,
                              color: Colors.deepPurple.withOpacity(0.5),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Project"), Text("9")],
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.greenAccent.withOpacity(0.5),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.purpleAccent.withOpacity(0.5),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.orangeAccent.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
              ),
            ),

            //Tasks=========================================
            StreamBuilder(
              stream: taskService.taskStreamer(),
              builder: (context, snapshot) {
                List<QueryDocumentSnapshot<Map<String, dynamic>>> items =
                    snapshot.data!.toList();
                return Column(
                  children: List.generate(items.length,
                  (index) => TaskWidget(name: items[index].get("name") , done: items[index].get("done"),),
                  ),
                );
                //   ListView.builder(
                //   itemCount: snapshot.data!.length,
                //   itemBuilder: (context, index) => TaskWidget(
                //     name: items[index].get("name"),
                //   ),
                // );
              },
            ),

            // Button create new tasks==============================
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateTaskPage(),
                  )),
              child: Container(
                width: 400,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF9747FF),
                ),
                child: const Center(
                  child: Text(
                    "Create new task",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
