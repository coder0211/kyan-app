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
  ManagerAddress._();
  static const String domain = 'https://kyan-api.tdsof.dev';
  // static const String domain = 'http://192.168.1.6:3001';
  // static const String domain = 'http://172.3.0.240:3001';
  //!--        BASE URL       -->
  //?-- ACCOUNT -->
  static const String baseAccount = '/account';
  static const String account = '$baseAccount';
  static const String accountCreateOrUpdate = '$baseAccount/create-or-update';
  static const String accountLogin = '$baseAccount/login';
  static const String accountDelete = '$baseAccount/delete';
  static const String accountGetOne = '$baseAccount';
  static const String accountGetAll = '$baseAccount/get-all';

  //?-- WORKSPACE -->
  static const String baseWorkspace = '/work-space';
  static const String workspacesGetAllById =
      '$baseWorkspace/get-all-by-id-user';
  static const String workspacesGetOne = '$baseWorkspace/get-one';
  static const String workspacesDelete = '$baseWorkspace/delete';
  static const String worksapceCreateOrUpdate =
      '$baseWorkspace/create-or-update';
  static const String workspacesGetByCodeJoin =
      '$baseWorkspace/get-by-code-join';

  //?-- TASK -->
  static const String baseTask = '/task';
  static const String taskCreateOrUpdate = '$baseTask/create-or-update';
  static const String taskGetOne = '$baseTask/get-one';
  static const String taskGetAll = '$baseTask/get-all';
  static const String taskDelete = '$baseTask/delete';

  //?-- MEMBERS OF WORKSPACE -->
  static const String baseMemberWorkspace = '/member-work-space';
  static const String addMemberWorkspace = '$baseMemberWorkspace/create';
  static const String deleteMemberWorkspace = '$baseMemberWorkspace/delete';

  //? -- FILE --
  static const String baseFile = '/file';
  static const String uploadSingleFile = '$baseFile/upload-single-file';
}
