// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workspace _$WorkspaceFromJson(Map<String, dynamic> json) => Workspace(
      workspaceId: json['workspaceId'] as int,
      workspaceName: json['workspaceName'] as String?,
      workspaceUrlPhoto: json['workspaceUrlPhoto'] as String?,
      workspaceCodeJoin: json['workspaceCodeJoin'] as String?,
    );

Map<String, dynamic> _$WorkspaceToJson(Workspace instance) => <String, dynamic>{
      'workspaceId': instance.workspaceId,
      'workspaceName': instance.workspaceName,
      'workspaceUrlPhoto': instance.workspaceUrlPhoto,
      'workspaceCodeJoin': instance.workspaceCodeJoin,
    };
