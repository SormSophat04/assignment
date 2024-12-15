import 'dart:ui';

import 'package:flutter/material.dart';

import '../views/profile_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final String userName;
  const CustomAppBar({super.key , required this.userName});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 15,sigmaY: 15),
      child: Opacity(
        opacity: 1,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
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
                      "Hello ${userName},",
                      style: const TextStyle(fontSize: 24),
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
      ),
        ),
    );
  }
  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
