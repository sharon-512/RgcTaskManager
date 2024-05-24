import 'package:flutter/material.dart';
import 'package:rgc_task_manager/model/db_functions.dart';
import 'package:rgc_task_manager/model/task_item_model.dart';
import 'package:rgc_task_manager/widgets/common_appbar.dart';

class TaskDetails extends StatelessWidget {
  final TaskItemModel task;

  const TaskDetails({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(showBackArrow: true, title: task.taskName.toString(),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.menu, color: Colors.grey,),
                SizedBox(width: 4),
                Text(
                  'Task Name',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              task.taskName.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Icon(Icons.library_books, color: Colors.grey,),
                SizedBox(width: 4),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              task.taskDescription.toString(),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.outlined_flag, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  '${task.priority} Priority',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.calendar_month_outlined, color: Colors.grey),
                const SizedBox(width: 4),
                const Text(
                  'From date',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${task.startDate.toString()}  at  ${task.startTime}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.calendar_month_outlined, color: Colors.grey),
                const SizedBox(width: 4),
                const Text(
                  'To date',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${task.endDate.toString()}  at  ${task.endTime}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text('Delete Task'),
                onPressed: () {
                  if (task.id != null) {
                    deleteTask(task.id!);
                  } else {
                    print('Task id is  -- null');
                  }
                  Navigator.pop(context);
                  getTaskList();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
