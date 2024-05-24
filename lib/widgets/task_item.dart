import 'package:flutter/material.dart';
import 'package:rgc_task_manager/model/task_item_model.dart';
import 'package:rgc_task_manager/screens/task_details.dart';
class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});
  final TaskItemModel task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaskDetails(task: task,)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        padding: const EdgeInsets.all(12),
        height: 105,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: const Color(0x33000000).withOpacity(0.1),
              offset: const Offset(4, 4),
            )
          ],
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(task.taskName ?? 'Task Name',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_month_outlined,
                      size: 18,color: Colors.grey,),
                    Text(task.startDate ?? 'Start date',
                    style: const TextStyle(
                      color: Colors.black45
                      ),
                    ),
                    const SizedBox(width: 20,),
                    const Icon(Icons.flag_outlined,
                      size: 18,color: Colors.grey,),
                    Text(task.endDate ?? 'end date',
                      style: const TextStyle(
                          color: Colors.black45
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(task.priority ?? 'priority',
                      style: const TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
