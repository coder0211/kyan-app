import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  final int? taskId;
  final String? taskCreateBy;
  String? taskSummary;
  String? taskDescription;
  DateTime? taskDueTimeLTE;
  DateTime? taskDueTimeGTE;
  int? taskIsDone;
  String? taskCreateAt;
  int? taskWorkspaceId;
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
