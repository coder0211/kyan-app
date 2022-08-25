import 'package:json_annotation/json_annotation.dart';

part 'workspace.g.dart';

@JsonSerializable()
class Workspace {
  final int workspaceId;
  final String? workspaceName;
  final String? workspaceUrlPhoto;
  final String? workspaceCodeJoin;

  Workspace(
      {required this.workspaceId,
      this.workspaceName,
      this.workspaceUrlPhoto,
      this.workspaceCodeJoin});
  factory Workspace.fromJson(Map<String, dynamic> json) {
    return _$WorkspaceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkspaceToJson(this);
}
