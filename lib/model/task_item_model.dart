
import 'package:hive/hive.dart';
part 'task_item_model.g.dart';

@HiveType(typeId: 1)

class TaskItemModel {

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? taskName;

  @HiveField(2)
  String? taskDescription;

  @HiveField(3)
  String? priority;

  @HiveField(4)
  String? startDate;

  @HiveField(5)
  String? endDate;

  @HiveField(6)
  String? startTime;

  @HiveField(7)
  String? endTime;

  TaskItemModel({
    this.id,
    required this.taskName,
    required this.taskDescription,
    required this.priority,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
  });
}