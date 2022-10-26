// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultPost _$ResultPostFromJson(Map<String, dynamic> json) => ResultPost(
      fieldCount: json['fieldCount'] as int?,
      affectedRows: json['affectedRows'] as int?,
      insertId: json['insertId'] as int?,
      serverStatus: json['serverStatus'] as int?,
      warningCount: json['warningCount'] as int?,
      message: json['message'] as String?,
      protocol41: json['protocol41'] as bool?,
      changedRows: json['changedRows'] as int?,
    );

Map<String, dynamic> _$ResultPostToJson(ResultPost instance) =>
    <String, dynamic>{
      'fieldCount': instance.fieldCount,
      'affectedRows': instance.affectedRows,
      'insertId': instance.insertId,
      'serverStatus': instance.serverStatus,
      'warningCount': instance.warningCount,
      'message': instance.message,
      'protocol41': instance.protocol41,
      'changedRows': instance.changedRows,
    };
