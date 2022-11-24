// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      channelId: json['channelId'] as int?,
      channelName: json['channelName'] as String?,
      channelIsPrivate: json['channelIsPrivate'] as int?,
      channelWorkspaceId: json['channelWorkspaceId'] as int?,
      accountMailOwner: json['accountMailOwner'] as String?,
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'channelId': instance.channelId,
      'channelName': instance.channelName,
      'channelIsPrivate': instance.channelIsPrivate,
      'channelWorkspaceId': instance.channelWorkspaceId,
      'accountMailOwner': instance.accountMailOwner,
      'members': instance.members,
    };
