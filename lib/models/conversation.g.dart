// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      conversationId: json['conversationId'] as int?,
      conversationThemeId: json['conversationThemeId'] as int?,
      conversationWorkspaceId: json['conversationWorkspaceId'] as int?,
      listMember: (json['listMember'] as List<dynamic>?)
          ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'conversationThemeId': instance.conversationThemeId,
      'conversationWorkspaceId': instance.conversationWorkspaceId,
      'listMember': instance.listMember,
    };
