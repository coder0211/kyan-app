import 'package:json_annotation/json_annotation.dart';

part 'attachment_task.g.dart';

@JsonSerializable()
class AttachmentTask {
  final int attachmentId;
  final int taskId;
  final String attachmentUrl;
  AttachmentTask(
      {required this.attachmentId,
      required this.taskId,
      required this.attachmentUrl});

  factory AttachmentTask.fromJson(Map<String, dynamic> json) =>
      _$AttachmentTaskFromJson(json);
  Map<String, dynamic> toJson() => _$AttachmentTaskToJson(this);
}
