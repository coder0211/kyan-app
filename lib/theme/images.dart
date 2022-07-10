/// ## Images constants all image and icon path of the app
/// * [images] is the image path of the app
/// * [icons] is the icon path of the app
/// * Example:
/// ```dart
/// import 'package:trygo/theme/images.dart';
/// Image.asset(images.imageIntro1);
/// ```
class Images {
  Images._();

  static const String iconPath = 'lib/res/icons';
  static const String imagePath = 'lib/res/images';
  // ICONS
  static const String iconLogoApp = '$iconPath/icon_logo_app.png';
  static const String iconLogoAppWhite = '$iconPath/icon_logo_app_white.png';
  static const String iconTask = '$iconPath/icon_task.svg';
  static const String iconTaskSelected = '$iconPath/icon_task_selected.svg';
  static const String iconChat = '$iconPath/icon_chat.svg';
  static const String iconChatSelected = '$iconPath/icon_chat_selected.svg';
  static const String iconProfile = '$iconPath/icon_profile.svg';
  static const String iconProfileSelected =
      '$iconPath/icon_profile_selected.svg';
  static const String iconBot = '$iconPath/icon_bot.svg';
  static const String iconBotSelected = '$iconPath/icon_bot_selected.svg';
  static const String iconGoogle = '$iconPath/icon_google.png';

  //IMAGES
  static const String imageIntro1 = '$imagePath/image_intro_1.png';
  static const String imageIntro2 = '$imagePath/image_intro_2.png';
  static const String imageIntro3 = '$imagePath/image_intro_3.png';
  static const String imageIntro4 = '$imagePath/image_intro_4.png';
}
