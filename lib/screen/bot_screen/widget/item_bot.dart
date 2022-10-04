import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/theme/colors.dart';

class ItemBot extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;
  final Color iconColor;
  const ItemBot({
    Key? key,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: AppColors.primary.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const SizedBox(width: 8),
              BaseSVG(path: iconPath, height: 24, color: iconColor),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title.b1R(color: AppColors.black),
                      description.b2R(color: AppColors.gray),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
