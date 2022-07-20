/// ## Manager Address contain all the information about the manager address.
/// * [domain] is the domain of the api app
/// * Example:
/// ```dart
/// import 'package:trygo/manager/manager_address.dart';
/// ...
/// url : ManagerAddress.domain;
/// ...
/// ```
class ManagerAddress {
  static const String domain = 'https://kyan-api.tdsof.dev';
  // static const String domain = 'http://192.168.1.107:3001';
  static const String createUpdateAccount = '/account';
}
