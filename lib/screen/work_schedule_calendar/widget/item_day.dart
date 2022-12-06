import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/theme/colors.dart';

class ItemDay extends StatelessWidget {
  String? title;
  String? description;
  ItemDay({
    Key? key,
    this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shadowColor: AppColors.primary.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title!.b1(color: AppColors.black),
                      description!.b2R(color: AppColors.gray),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
