import 'package:ass_midterm_one/views/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/Property 1=Variant2.jpg"),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // Icon(Icons.arrow_left),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28, bottom: 20),
                          child: SvgPicture.asset(
                            "assets/icons/back.svg",
                            width: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                  const Hero(
                    tag: "users_tag",
                    child: Image(image: AssetImage(
                      "assets/images/users.png",
                    ),width: 200,),
                  ),
                  const Text(
                    "Varun Cupta",
                    style: TextStyle(fontSize: 26),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 480,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 60,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email"),
                    const SizedBox(height: 5),
                    Container(
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black,
                        ),
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "example@gmail.com",
                            hintStyle: TextStyle(
                              color: Colors.black54,
                              fontFamily: "inter",
                              fontSize: 15,
                            ),
                            icon: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    const Text("Phone"),
                    const SizedBox(height: 5),
                    Container(
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black,
                        ),
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "(+855) xxx-xxx-xxx",
                            hintStyle: TextStyle(
                                color: Colors.black54,
                                fontFamily: "inter",
                                fontSize: 15),
                            icon: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AuthPage(),
                              )),
                          child: Container(
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xFFFF5757),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Center(
                                child: Text(
                              "Log Out",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Image.asset("assets/icons/bgf.png")],
            )
          ],
        ),
      ),
    );
  }
}
