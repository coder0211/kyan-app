import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  late final String? accountId;
  final String? accountMail;
  String? accountUrlPhoto;
  final String? accountDisplayName;
  // account google give
  @JsonKey(name: 'accountToken')
  String? accountToken;
  @JsonKey(name: 'token')
  String? accountAccessToken;
  bool isSelected;
  int? workspaceMemberIsOwner;
  int? channelMemberOwner;

  Account(
      {this.accountId,
      this.accountMail,
      this.accountUrlPhoto,
      this.accountDisplayName,
      this.accountToken,
      this.accountAccessToken,
      this.isSelected = false,
      this.workspaceMemberIsOwner});

  factory Account.fromJson(Map<String, dynamic> json) {
    return _$AccountFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
