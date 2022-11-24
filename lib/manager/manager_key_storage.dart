/// ## Manager Address contain all the information about the manager address.
/// * Example:
/// ```dart
/// import 'package:trygo/manager/manager_key_storage.dart';
/// ...
///  ManagerAddress.domain;
/// ...
/// ```
class ManagerKeyStorage {
  ManagerKeyStorage._();
  static const String isFirst = 'IS_FIRST';
  static const String currentWorkspace = 'CURRENT_WORKSPACE';
  static const String currentChannel = 'CURRENT_CHANNEL';
  static const String accessToken = 'ACCESS_TOKEN';
  static const String language = 'LANGUAGE';
}
