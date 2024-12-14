import 'package:ass_midterm_one/views/create_task_page.dart';
import 'package:ass_midterm_one/views/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controller/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authservice = AuthService();

  void logOut() {
    authservice.logOut();
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
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello Varun,",
                          style: TextStyle(fontSize: 26),
                        ),
                        Text(
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
                      child: const Image(
                        image: AssetImage(
                          "assets/images/users.png",
                        ),
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Category=====================================
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.amber,
              child: const Center(
                child: Text("category"),
              ),
            ),

            //Tasks=============================================
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: 460,
                color: Colors.blue,
                child: const Center(
                  child: Text("task"),
                ),
              ),
            ),

            //Button create new tasks==============================
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
