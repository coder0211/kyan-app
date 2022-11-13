// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelMessage _$ChannelMessageFromJson(Map<String, dynamic> json) =>
    ChannelMessage(
      channelMessageId: json['channelMessageId'] as int?,
      channelMessageContent: json['channelMessageContent'] as String?,
      channelMessageChannelId: json['channelMessageChannelId'] as int?,
      channelMessageSenderId: json['channelMessageSenderId'] as String?,
      channelMessageTimeSend: json['channelMessageTimeSend'] as String?,
      owner: $enumDecodeNullable(_$MessageOwnerEnumMap, json['owner']),
    );

Map<String, dynamic> _$ChannelMessageToJson(ChannelMessage instance) =>
    <String, dynamic>{
      'channelMessageId': instance.channelMessageId,
      'channelMessageContent': instance.channelMessageContent,
      'channelMessageTimeSend': instance.channelMessageTimeSend,
      'channelMessageChannelId': instance.channelMessageChannelId,
      'channelMessageSenderId': instance.channelMessageSenderId,
      'owner': _$MessageOwnerEnumMap[instance.owner],
    };

const _$MessageOwnerEnumMap = {
  MessageOwner.myself: 'myself',
  MessageOwner.other: 'other',
};
