// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      taskId: json['taskId'] as int?,
      taskCreateBy: json['taskCreateBy'] as String?,
      taskSummary: json['taskSummary'] as String?,
      taskDescription: json['taskDescription'] as String?,
      taskDueTimeLTE: json['taskDueTimeLTE'] == null
          ? null
          : DateTime.parse(json['taskDueTimeLTE'] as String),
      taskDueTimeGTE: json['taskDueTimeGTE'] == null
          ? null
          : DateTime.parse(json['taskDueTimeGTE'] as String),
      taskIsDone: json['taskIsDone'] as int?,
      taskCreateAt: json['taskCreateAt'] as String?,
      taskWorkspaceId: json['taskWorkspaceId'] as int?,
      taskAssignTo: json['taskAssignTo'] as String?,
    )..attachment = json['attachment'] as String?;

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'taskId': instance.taskId,
      'taskCreateBy': instance.taskCreateBy,
      'taskSummary': instance.taskSummary,
      'taskDescription': instance.taskDescription,
      'taskDueTimeLTE': instance.taskDueTimeLTE?.toIso8601String(),
      'taskDueTimeGTE': instance.taskDueTimeGTE?.toIso8601String(),
      'taskIsDone': instance.taskIsDone,
      'taskCreateAt': instance.taskCreateAt,
      'taskWorkspaceId': instance.taskWorkspaceId,
      'taskAssignTo': instance.taskAssignTo,
      'attachment': instance.attachment,
    };
