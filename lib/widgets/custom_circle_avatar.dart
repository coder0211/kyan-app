import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/images.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String? imageUrl;
  final File? file;
  final double? width;
  final bool isShowBordered;

  const CustomCircleAvatar({
    Key? key,
    this.imageUrl,
    this.file,
    this.width,
    this.isShowBordered = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildImage(context);
  }

  Widget _buildImage(BuildContext context) {
    return imageUrl != null && file == null
        ? _getImageFromUrl(context)
        : _getImageFromFilePath(context);
  }

  Widget _getImageFromUrl(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? BaseUtils.getScreenWidth(context),
      height: width ?? BaseUtils.getScreenWidth(context),
      imageUrl: imageUrl!,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
            border: isShowBordered
                ? Border.all(color: AppColors.white, width: 3)
                : null,
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
      ),
      placeholder: (context, url) => const BaseIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Widget _getImageFromFilePath(BuildContext context) {
    return file != null
        ? ClipOval(
            child: Image.file(
            file!,
            fit: BoxFit.cover,
            height: width ?? BaseUtils.getScreenWidth(context),
            width: width ?? BaseUtils.getScreenWidth(context),
          ))
        : Container(
            alignment: Alignment.center,
            height: width ?? BaseUtils.getScreenWidth(context),
            width: width ?? BaseUtils.getScreenWidth(context),
            decoration: BoxDecoration(
              border: isShowBordered
                  ? Border.all(color: AppColors.white, width: 3)
                  : null,
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: Image(
                height: width ?? BaseUtils.getScreenWidth(context),
                width: width ?? BaseUtils.getScreenWidth(context),
                image: const AssetImage(Images.iconProfile)));
  }
}
