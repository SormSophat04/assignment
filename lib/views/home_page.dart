import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: logOut, icon: Icon(Icons.logout_rounded , color: Colors.purpleAccent,))
        ],
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}
