// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      taskId: json['taskId'] as String?,
      taskCreateBy: json['taskCreateBy'] as String?,
      taskSummary: json['taskSummary'] as String?,
      taskDescription: json['taskDescription'] as String?,
      taskDueTimeLTE: json['taskDueTimeLTE'] == null
          ? null
          : DateTime.parse(json['taskDueTimeLTE'] as String),
      taskDueTimeGTE: json['taskDueTimeGTE'] == null
          ? null
          : DateTime.parse(json['taskDueTimeGTE'] as String),
      taskIsDone: json['taskIsDone'] as bool?,
      taskCreateAt: json['taskCreateAt'] as String?,
      taskWorkspaceId: json['taskWorkspaceId'] as String?,
      staskAssignTo: json['staskAssignTo'] as String?,
    );

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
      'staskAssignTo': instance.staskAssignTo,
    };