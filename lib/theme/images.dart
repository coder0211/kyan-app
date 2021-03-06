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
  static const String iconTime = '$iconPath/icon_time.svg';

  //IMAGES
  static const String imageIntro1 = '$imagePath/image_intro_1.png';
  static const String imageIntro2 = '$imagePath/image_intro_2.png';
  static const String imageIntro3 = '$imagePath/image_intro_3.png';
  static const String imageIntro4 = '$imagePath/image_intro_4.png';
}
