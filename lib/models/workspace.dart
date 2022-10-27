import 'package:json_annotation/json_annotation.dart';
import 'package:kyan/models/account.dart';

part 'workspace.g.dart';

@JsonSerializable()
class Workspace {
  final int? workspaceId;
  final String? workspaceName;
  final String? workspaceUrlPhoto;
  final String? workspaceCodeJoin;
  final List<Account>? members;

  Workspace({
    this.workspaceId,
    this.workspaceName,
    this.workspaceUrlPhoto,
    this.workspaceCodeJoin,
    this.members,
  });
  factory Workspace.fromJson(Map<String, dynamic> json) {
    return _$WorkspaceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WorkspaceToJson(this);
}
