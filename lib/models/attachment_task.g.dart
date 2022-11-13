// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentTask _$AttachmentTaskFromJson(Map<String, dynamic> json) =>
    AttachmentTask(
      attachmentId: json['attachmentId'] as int,
      taskId: json['taskId'] as int,
      attachmentUrl: json['attachmentUrl'] as String,
    );

Map<String, dynamic> _$AttachmentTaskToJson(AttachmentTask instance) =>
    <String, dynamic>{
      'attachmentId': instance.attachmentId,
      'taskId': instance.taskId,
      'attachmentUrl': instance.attachmentUrl,
    };
