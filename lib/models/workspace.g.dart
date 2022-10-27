// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workspace _$WorkspaceFromJson(Map<String, dynamic> json) => Workspace(
      workspaceId: json['workspaceId'] as int?,
      workspaceName: json['workspaceName'] as String?,
      workspaceUrlPhoto: json['workspaceUrlPhoto'] as String?,
      workspaceCodeJoin: json['workspaceCodeJoin'] as String?,
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkspaceToJson(Workspace instance) => <String, dynamic>{
      'workspaceId': instance.workspaceId,
      'workspaceName': instance.workspaceName,
      'workspaceUrlPhoto': instance.workspaceUrlPhoto,
      'workspaceCodeJoin': instance.workspaceCodeJoin,
      'members': instance.members,
    };
