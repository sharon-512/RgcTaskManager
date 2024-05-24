import 'package:flutter/material.dart';
import 'package:rgc_task_manager/model/db_functions.dart';
import 'package:rgc_task_manager/screens/task_creator.dart';
import 'package:rgc_task_manager/widgets/common_appbar.dart';
import 'package:rgc_task_manager/widgets/task_filter.dart';
import 'package:rgc_task_manager/widgets/task_item.dart';

import '../model/task_item_model.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    getTaskList();
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: const CommonAppbar(
        showBackArrow: false,
        title: 'To-Do List',),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder(
              valueListenable: taskListNotifier,
              builder: (context, List<TaskItemModel> taskList, child) {
                return Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //color: Colors.black,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF676767),
                        Colors.black,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              taskList.length.toString(),
                              style: const TextStyle(
                                fontSize: 45,
                                color: Colors.white,
                              ),
                            ),
                            const Text('Total Number Of Task',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.library_books_outlined, size: 70,color: Colors.grey,),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            const AddTask(),
            const SizedBox(height: 30),
            const Text('Task List',
              style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox(height: 10),
            Row(
              children: [
                TaskFilter(
                  priority: 'All',
                  isSelected: selectedFilter == 'All',
                  onSelected: updateSelectedFilter,
                ),
                const SizedBox(width: 6),
                TaskFilter(
                  priority: 'High',
                  isSelected: selectedFilter == 'High',
                  onSelected: updateSelectedFilter,
                ),
                const SizedBox(width: 6),
                TaskFilter(
                  priority: 'Medium',
                  isSelected: selectedFilter == 'Medium',
                  onSelected: updateSelectedFilter,
                ),
                const SizedBox(width: 6),
                TaskFilter(
                  priority: 'Low',
                  isSelected: selectedFilter == 'Low',
                  onSelected: updateSelectedFilter,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 378,
              child: ValueListenableBuilder(
                valueListenable: taskListNotifier,
                builder: (context, List<TaskItemModel> taskList, child) {
                  final filteredTasks = filteredTaskList();
                  return ListView.builder(
                    itemCount: filteredTasks.length,
                    itemBuilder: (context, index) {
                      return TaskItem(task: filteredTasks[index],);
                    },);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void updateSelectedFilter(String priority) {
    setState(() {
      selectedFilter = priority;
    });
  }

  List<TaskItemModel> filteredTaskList() {
    final allTasks = taskListNotifier.value;
    List<TaskItemModel> tasks;
    if (selectedFilter == 'All') {
      tasks = allTasks;
    } else {
      tasks = allTasks.where((task) => task.priority == selectedFilter).toList();
    }
    return tasks.reversed.toList(); // Reverse the list
  }
}

