import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_page copy.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          )),
                      child: SvgPicture.asset(
                        "assets/icons/back.svg",
                        width: 14,
                      ),
                    ),
                    const Text(
                      "Create a new task",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Icon(
                      Icons.menu,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),

            //textfield task name======================================

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Task Name"),
                    const SizedBox(height: 5),
                    Container(
                      width: 380,
                      height: 42,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Task name",
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: "inter",
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
