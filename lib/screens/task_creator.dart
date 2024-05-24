import 'package:flutter/material.dart';
import 'package:rgc_task_manager/model/db_functions.dart';
import 'package:rgc_task_manager/widgets/custom_text_field.dart';
import 'package:rgc_task_manager/widgets/date_picker.dart';
import 'package:rgc_task_manager/widgets/time_picker.dart';

import '../model/task_item_model.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final taskNameController = TextEditingController();
  final taskDiscriptionController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final dateController = TextEditingController();
  String selectedPriority = 'High';
  String startDate = '';
  String endDate = '';
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    taskNameController.addListener(_validateFields);
    taskDiscriptionController.addListener(_validateFields);
    startTimeController.addListener(_validateFields);
    endTimeController.addListener(_validateFields);
  }

  void _validateFields() {
    setState(() {
      isButtonEnabled = taskNameController.text.isNotEmpty &&
          taskDiscriptionController.text.isNotEmpty &&
          startTimeController.text.isNotEmpty &&
          endTimeController.text.isNotEmpty &&
          startDate.isNotEmpty &&
          endDate.isNotEmpty;
    });
  }

  @override
  void dispose() {
    taskNameController.dispose();
    taskDiscriptionController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Create New Task',
            ),
            Icon(Icons.arrow_forward)
          ],
        ),
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.white,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.72,
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                            child: Text(
                              'Create New Task',
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )),
                        const SizedBox(height: 30),
                        const Text(
                          'Task Name',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        CustomTextField(
                          controller: taskNameController,
                          hintText: 'Enter Task Name (Mandatory)', maxLength: 70,
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Description',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        CustomTextField(
                            controller: taskDiscriptionController,
                            hintText: 'Enter Description (Mandatory)', maxLength: 250,),
                        const SizedBox(height: 5),
                        const Text(
                          'Priority',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedPriority = 'High';
                                  _validateFields();
                                });
                              },
                              child: priorityItem(selectedPriority, 'High'),
                            ),
                            const SizedBox(width: 6),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedPriority = 'Medium';
                                  _validateFields();
                                });
                              },
                              child: priorityItem(selectedPriority, 'Medium'),
                            ),
                            const SizedBox(width: 6),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedPriority = 'Low';
                                  _validateFields();
                                });
                              },
                              child: priorityItem(selectedPriority, 'Low'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Task Date',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 5),
                        CustomDatePicker(
                          hintText: 'From-To-Dates',
                          controller: dateController,
                          onStartDateChanged: (date) {
                            setState(() {
                              startDate = date;
                              _validateFields();
                            });
                          },
                          onEndDateChanged: (date) {
                            setState(() {
                              endDate = date;
                              _validateFields();
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTimePicker(
                                  controller: startTimeController,
                                  hintText: 'Start time',
                                  onTimeChanged: (time) {
                                    setState(() {
                                      _validateFields();
                                    });
                                  },
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: CustomTimePicker(
                                  controller: endTimeController,
                                  hintText: 'End time',
                                  onTimeChanged: (time) {
                                    setState(() {
                                      _validateFields();
                                    }
                                    );
                                  },),
                            ),
                          ],
                        ),
                        const Text(
                          'Date and time field is mandatory',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: isButtonEnabled
                                    ? Colors.blueAccent
                                    : Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: isButtonEnabled
                                ? () {
                              TaskItemModel taskItem = TaskItemModel(
                                taskName: taskNameController.text,
                                taskDescription:
                                taskDiscriptionController.text,
                                priority: selectedPriority,
                                startTime: startTimeController.text,
                                endTime: endTimeController.text,
                                startDate: startDate,
                                endDate: endDate,
                              );

                              // Add the new task to the list
                              addTask(taskItem);

                              Navigator.pop(context);
                              taskNameController.clear();
                              taskDiscriptionController.clear();
                              startTimeController.clear();
                              endTimeController.clear();
                              dateController.clear();
                              startDate = '';
                              endDate = '';
                              selectedPriority = 'High';
                              setState(() {
                                isButtonEnabled = false;
                              });
                            }
                                : null,
                            child: const Text('Create New Task'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget priorityItem(String selectedPriority, String priority) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(30),
        color:
        selectedPriority == priority ? Colors.blueAccent : Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Text(
          priority,
          style: TextStyle(
            color: selectedPriority == priority
                ? Colors.white
                : Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
