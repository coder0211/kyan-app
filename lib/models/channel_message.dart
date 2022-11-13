import 'package:json_annotation/json_annotation.dart';

part 'channel_message.g.dart';

enum MessageOwner { myself, other }

@JsonSerializable()
class ChannelMessage {
  final int? channelMessageId;
  final String? channelMessageContent;
  final String? channelMessageTimeSend;
  final int? channelMessageChannelId;
  final String? channelMessageSenderId;
  MessageOwner? owner;

  ChannelMessage(
      {this.channelMessageId,
      this.channelMessageContent,
      this.channelMessageChannelId,
      this.channelMessageSenderId,
      this.channelMessageTimeSend,
      this.owner});

  factory ChannelMessage.fromJson(Map<String, dynamic> json) =>
      _$ChannelMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ChannelMessageToJson(this);
}
