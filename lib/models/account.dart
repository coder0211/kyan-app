import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final String? mail;
  String? urlPhoto;
  final String? displayName;
  bool isSelected;

  Account(
      {this.mail, this.urlPhoto, this.displayName, this.isSelected = false});

  factory Account.fromJson(Map<String, dynamic> json) {
    return _$AccountFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
