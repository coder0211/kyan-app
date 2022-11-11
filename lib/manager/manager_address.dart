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
  static String domain = '';
  //?--        BASE URL       -->
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
  static const String getAllMemberWorkspace = '$baseMemberWorkspace/get-all';
  //? -- CONVERSATION --
  static const String baseConversation = '/converstion';
  static const String deleteConversation = '$baseConversation/delete';
  static const String getAllConversation = '$baseConversation/get-all';
  static const String createOrUpdateConversation =
      '$baseConversation/create-or-update';
  //? -- Channel chat --
  static const String baseChannel = '/channel';
  static const String createOrUpdateChannelChat =
      '$baseChannel/create-or-update';

  //? -- FILE --
  static const String baseFile = '/file';
  static const String uploadSingleFile = '$baseFile/upload-single-file';
}
