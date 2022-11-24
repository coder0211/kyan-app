// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_up_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultUpFile _$ResultUpFileFromJson(Map<String, dynamic> json) => ResultUpFile(
      fieldname: json['fieldname'] as String?,
      originalname: json['originalname'] as String?,
      encoding: json['encoding'] as String?,
      mimetype: json['mimetype'] as String?,
      destination: json['destination'] as String?,
      fileName: json['filename'] as String?,
      path: json['path'] as String?,
    );

Map<String, dynamic> _$ResultUpFileToJson(ResultUpFile instance) =>
    <String, dynamic>{
      'fieldname': instance.fieldname,
      'originalname': instance.originalname,
      'encoding': instance.encoding,
      'mimetype': instance.mimetype,
      'destination': instance.destination,
      'filename': instance.fileName,
      'path': instance.path,
    };
