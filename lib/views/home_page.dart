import 'dart:developer';
import 'dart:ui';

import 'package:ass_midterm_one/components/custom_app_bar.dart';
import 'package:ass_midterm_one/components/task_widget.dart';
import 'package:ass_midterm_one/controller/task_service.dart';
import 'package:ass_midterm_one/views/create_task_page.dart';
import 'package:ass_midterm_one/views/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomAppBar(userName: userName),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Category=====================================
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width / 1.2 +
                  AppBar().preferredSize.height,

              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Center(
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.blueAccent.shade200.withOpacity(0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.5)),
                            child: const Icon(
                              Icons.folder_copy_outlined,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("All tasks"), Text("9")],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.greenAccent.shade200.withOpacity(0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.5)),
                            child: Icon(
                              Icons.book_outlined,
                              color: Colors.greenAccent.shade700,
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Education"), Text("9")],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.purpleAccent.shade100.withOpacity(0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.5)),
                            child: Icon(
                              Icons.car_repair_outlined,
                              color: Colors.purpleAccent.shade700,
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Work"), Text("9")],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.orangeAccent.shade100.withOpacity(0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.5)),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.amber.shade600,
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("All tasks"), Text("9")],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Tasks=========================================
            StreamBuilder(
              stream: taskService.taskStreamer(),
              builder: (context, snapshot) {
                List<QueryDocumentSnapshot<Map<String, dynamic>>> items =
                    snapshot.hasData ? snapshot.data!.toList() : [];
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("has some error!!"),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("No data yet"),
                  );
                }
                return Column(
                  children: List.generate(
                        items.length,
                        (index) => Slidable(
                            startActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              children: [
                                SlidableAction(
                                  label: items[index].get("done")
                                      ? "Remove"
                                      : "Complete",
                                  foregroundColor: items[index].get("done")
                                      ? Colors.redAccent
                                      : Colors.greenAccent[700],
                                  backgroundColor: items[index].get("done")
                                      ? Colors.redAccent.withOpacity(0.2)
                                      : Colors.greenAccent.withOpacity(0.2),
                                  icon: items[index].get("done")
                                      ? Icons.remove_circle_outline_rounded
                                      : Icons.check_rounded,
                                  onPressed: (BuildContext context) {},
                                )
                              ],
                            ),
                            child: TaskWidget(
                              name: items[index].get("name"),
                              done: items[index].get("done"),
                            )),
                      ) +
                      [
                        const Slidable(
                            child: SizedBox(
                          height: 100,
                        ))
                      ],
                );
                // );
              },
            ),
            // Button create new tasks==============================
            const SizedBox(height: 12),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateTaskPage(),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          width: 400,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF9747FF)),
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFF9747FF).withOpacity(0.5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
              child: const Center(
                child: Text(
                  "Create new task",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
