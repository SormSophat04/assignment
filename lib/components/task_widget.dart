import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  final bool done;
  final String name;
  const TaskWidget({super.key, required this.name, required this.done});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Easing.linear,
      duration: Duration(milliseconds: 800),
      alignment: Alignment.center,
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.withOpacity(0.5)),
          color: widget.done
              ? Colors.greenAccent.shade700.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: AnimatedContainer(
              alignment: Alignment.center,
              duration: Duration(milliseconds: 400),
              padding: const EdgeInsets.all(10),
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.done
                    ? Colors.greenAccent.withOpacity(0.5)
                    : Colors.transparent,
              ),
              child: Icon(
                widget.done
                    ? Icons.check_circle_rounded
                    : Icons.circle_outlined,
                color: widget.done ? Colors.green : Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [Text(widget.name)],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.mode_edit_outline_outlined , color: Colors.grey.withOpacity(0.8),),
                Icon(Icons.delete_outline_rounded , color: Colors.redAccent.withOpacity(0.8),weight: 0.5,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
