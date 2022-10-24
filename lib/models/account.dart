import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final String? accountId;
  final String? accountMail;
  String? accountUrlPhoto;
  final String? accountDisplayName;
  @JsonKey(name: 'accountToken')
  String? accountToken;
  @JsonKey(name: 'token')
  String? accountAccessToken;
  bool isSelected;

  Account(
      {this.accountId,
      this.accountMail,
      this.accountUrlPhoto,
      this.accountDisplayName,
      this.accountToken,
      this.accountAccessToken,
      this.isSelected = false});

  factory Account.fromJson(Map<String, dynamic> json) {
    return _$AccountFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
