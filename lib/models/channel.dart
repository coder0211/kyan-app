import 'package:json_annotation/json_annotation.dart';
import 'package:kyan/models/account.dart';

part 'channel.g.dart';

@JsonSerializable()
class Channel {
  final int? channelId;
  String? channelName;
  int? channelIsPrivate;
  int? channelWorkspaceId;
  String? accountMailOwner;
  final List<Account>? members;

  Channel({
    this.channelId,
    this.channelName,
    this.channelIsPrivate,
    this.channelWorkspaceId,
    this.accountMailOwner,
    this.members,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return _$ChannelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}
