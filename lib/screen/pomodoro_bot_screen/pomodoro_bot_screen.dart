import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kyan/api/notification_api.dart';
import 'package:kyan/const/consts.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/screen/pomodoro_bot_screen/store/pomodoro_bot_screen_store.dart';
import 'package:kyan/screen/pomodoro_bot_screen/widgets/round_button.dart';
import 'package:kyan/theme/colors.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:kyan/widgets/custom_appbar_back.dart';

class PomodoroBotScreen extends BaseScreen {
  const PomodoroBotScreen({Key? key}) : super(key: key);

  @override
  State<PomodoroBotScreen> createState() => _PomodoroBotScreenState();
}

class _PomodoroBotScreenState
    extends BaseScreenState<PomodoroBotScreen, PomodoroBotScreenStore>
    with TickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() async {
    if (countText == '0:00:00') {
      await FlutterRingtonePlayer.playNotification(asAlarm: true, volume: 100);
      await NotificationApi.showNotification(
          id: 0,
          title: S.of(context).titileKyanTime,
          body: S.of(context).congraOnyourCompletion,
          payload: '');
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: TIME_ANIMATION_SHORT),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);
  void onClickedNotification(String? payload) {}

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: S.of(context).titileKyanTime),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: BaseUtils.getScreenWidth(context) * 0.8,
                  height: BaseUtils.getScreenWidth(context) * 0.8,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey.shade300,
                    value: progress,
                    strokeWidth: 10,
                    color: AppColors.primary,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isDismissed) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: BaseUtils.getScreenWidth(context) * 0.8,
                          child: CupertinoTimerPicker(
                            initialTimerDuration: controller.duration!,
                            onTimerDurationChanged: (time) {
                              setState(() {
                                controller.duration = time;
                              });
                            },
                          ),
                        ),
                      );
                    }
                  },
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => Text(
                      countText,
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (controller.isAnimating) {
                      controller.stop();
                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      controller.reverse(
                          from: controller.value == 0 ? 1.0 : controller.value);
                      setState(() {
                        isPlaying = true;
                      });
                    }
                  },
                  child: RoundButton(
                    icon: isPlaying == true ? Icons.pause : Icons.play_arrow,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.reset();
                    setState(() {
                      isPlaying = false;
                    });
                  },
                  child: const RoundButton(
                    icon: Icons.stop,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
