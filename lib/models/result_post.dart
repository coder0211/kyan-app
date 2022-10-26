import 'package:json_annotation/json_annotation.dart';

part 'result_post.g.dart';

@JsonSerializable()
class ResultPost {
  ResultPost({
    this.fieldCount,
    this.affectedRows,
    this.insertId,
    this.serverStatus,
    this.warningCount,
    this.message,
    this.protocol41,
    this.changedRows,
  });

  final int? fieldCount;
  final int? affectedRows;
  final int? insertId;
  final int? serverStatus;
  final int? warningCount;
  final String? message;
  final bool? protocol41;
  final int? changedRows;

  factory ResultPost.fromJson(Map<String, dynamic> json) {
    return _$ResultPostFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultPostToJson(this);
}
