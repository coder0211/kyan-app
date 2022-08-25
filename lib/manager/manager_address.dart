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
  //!--        BASE URL       -->
  //?-- ACCOUNT -->
  static const String baseAccount = '/account';
  static const String account = '$baseAccount';
  static const String accountCreateOrUpdate = '$baseAccount/create-or-update';
  static const String accountLogin = '$baseAccount/login';
  static const String accountDelete = '$baseAccount/delete';

  //?-- WORKSPACE -->
  static const String baseWorkspace = '/work-space';
  static const String workspacesGetAll = '$baseWorkspace/get-all';
}
