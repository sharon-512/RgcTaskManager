// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rgc_task_manager/model/task_item_model.dart';

ValueNotifier<List<TaskItemModel>> taskListNotifier = ValueNotifier([]);

Future<void> addTask(TaskItemModel data) async {
  final taskListDb = await Hive.openBox<TaskItemModel>('task_list_db');
  final _id = await taskListDb.add(data);
  data.id = _id;
  await taskListDb.put(_id, data);
  taskListNotifier.value.add(data);
  taskListNotifier.notifyListeners();
}

Future<void> deleteTask(id) async {
  final taskListDb = await Hive.openBox<TaskItemModel>('task_list_db');
  taskListDb.delete(id);
}

Future<void> getTaskList() async{
  final taskListDb = await Hive.openBox<TaskItemModel>('task_list_db');
  taskListNotifier.value.clear();
  taskListNotifier.value.addAll(taskListDb.values);
  taskListNotifier.notifyListeners();
}
