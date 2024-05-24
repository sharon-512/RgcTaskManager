// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskItemModelAdapter extends TypeAdapter<TaskItemModel> {
  @override
  final int typeId = 1;

  @override
  TaskItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskItemModel(
      id: fields[0] as int?,
      taskName: fields[1] as String?,
      taskDescription: fields[2] as String?,
      priority: fields[3] as String?,
      startDate: fields[4] as String?,
      endDate: fields[5] as String?,
      startTime: fields[6] as String?,
      endTime: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskItemModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.taskName)
      ..writeByte(2)
      ..write(obj.taskDescription)
      ..writeByte(3)
      ..write(obj.priority)
      ..writeByte(4)
      ..write(obj.startDate)
      ..writeByte(5)
      ..write(obj.endDate)
      ..writeByte(6)
      ..write(obj.startTime)
      ..writeByte(7)
      ..write(obj.endTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
