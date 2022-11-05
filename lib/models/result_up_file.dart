import 'package:json_annotation/json_annotation.dart';

part 'result_up_file.g.dart';

@JsonSerializable()
class ResultUpFile {
  final String? fieldname;
  final String? originalname;
  final String? encoding;
  final String? mimetype;
  final String? destination;
  final String fileName;
  final String? path;
  ResultUpFile(
      {this.fieldname,
      this.originalname,
      this.encoding,
      this.mimetype,
      this.destination,
      required this.fileName,
      this.path});

  factory ResultUpFile.fromJson(Map<String, dynamic> json) =>
      _$ResultUpFileFromJson(json);
  Map<String, dynamic> toJson() => _$ResultUpFileToJson(this);
}
