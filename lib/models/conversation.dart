import 'package:json_annotation/json_annotation.dart';
import 'package:kyan/models/account.dart';

part 'conversation.g.dart';

@JsonSerializable()
class Conversation {
  final int? conversationId;
  int? conversationThemeId;
  int? conversationWorkspaceId;
  List<Account>? listMember;

  Conversation({
    this.conversationId,
    this.conversationThemeId,
    this.conversationWorkspaceId,
    this.listMember,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return _$ConversationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConversationToJson(this);
}
