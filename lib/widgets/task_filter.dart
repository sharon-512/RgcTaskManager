import 'package:flutter/material.dart';

class TaskFilter extends StatelessWidget {
  final String priority;
  final bool isSelected;
  final ValueChanged<String> onSelected;

  const TaskFilter({
    super.key,
    required this.priority,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(priority);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(30),
          color: isSelected ? Colors.blueAccent : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            priority,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
