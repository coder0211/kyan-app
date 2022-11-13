import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:kyan/models/channel_message.dart';
import 'package:kyan/screen/list_message_screen/widgets/bubble_painter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/widgets/custom_circle_avatar.dart';

@immutable
class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.child,
    required ChannelMessage message,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const messageAlignment = Alignment.topLeft;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: FractionallySizedBox(
        alignment: messageAlignment,
        widthFactor: 0.8,
        child: Align(
          alignment: messageAlignment,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Visibility(
                visible: true,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CustomCircleAvatar(
                    width: 30,
                    imageUrl: 'urlPhoto',
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: BubbleBackground(
                      colors: [
                        AppColors.gray.withOpacity(0.3),
                        AppColors.gray.withOpacity(0.3),
                      ],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 2, left: 10, right: 10),
                              child:
                                  'displayName'.b1(color: AppColors.primary)),
                          DefaultTextStyle.merge(
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.black),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 2, left: 10, right: 10),
                              child: child,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 10),
                            child: BaseText(
                              'yyyy-MM-dd HH:mm',
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: AppColors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
