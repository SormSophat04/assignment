import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  final bool done;
  final String name;
  const TaskWidget({super.key , required this.name , required this.done});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
        width: double.infinity,
        height: 100,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 1 , color: Colors.grey.withOpacity(0.5)),
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(24)
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.done ? Colors.lightGreen.withOpacity(0.5) : Colors.grey,
              ),
              child: Icon(widget.done ? Icons.check_circle_outline_rounded : Icons.circle_outlined)),
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
