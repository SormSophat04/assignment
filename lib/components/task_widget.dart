import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  final String name;
  const TaskWidget({super.key , required this.name});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(width: 1 , color: Colors.grey),
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(24)
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(widget.name)
            ],
          )
        ],
      ),
    );
  }
}
