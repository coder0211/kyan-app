// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      accountId: json['accountId'] as String?,
      accountMail: json['accountMail'] as String?,
      accountUrlPhoto: json['accountUrlPhoto'] as String?,
      accountDisplayName: json['accountDisplayName'] as String?,
      accountToken: json['accountToken'] as String?,
      accountAccessToken: json['accountAccessToken'] as String?,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'accountMail': instance.accountMail,
      'accountUrlPhoto': instance.accountUrlPhoto,
      'accountDisplayName': instance.accountDisplayName,
      'accountToken': instance.accountToken,
      'accountAccessToken': instance.accountAccessToken,
      'isSelected': instance.isSelected,
    };
