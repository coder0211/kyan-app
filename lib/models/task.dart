import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  final String? taskId;
  final String? taskCreateBy;
  String? taskSummary;
  String? taskDescription;
  DateTime? taskDueTimeLTE;
  DateTime? taskDueTimeGTE;
  bool? taskIsDone;
  String? taskCreateAt;
  String? taskWorkspaceId;
  String? staskAssignTo;

  Task(
      {this.taskId,
      this.taskCreateBy,
      this.taskSummary,
      this.taskDescription,
      this.taskDueTimeLTE,
      this.taskDueTimeGTE,
      this.taskIsDone,
      this.taskCreateAt,
      this.taskWorkspaceId,
      this.staskAssignTo});

  factory Task.fromJson(Map<String, dynamic> json) {
    return _$TaskFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
