// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      mail: json['mail'] as String?,
      urlPhoto: json['urlPhoto'] as String?,
      displayName: json['displayName'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'mail': instance.mail,
      'urlPhoto': instance.urlPhoto,
      'displayName': instance.displayName,
      'isSelected': instance.isSelected,
    };
