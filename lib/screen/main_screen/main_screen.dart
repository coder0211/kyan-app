import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/screen/main_screen/store/main_screen_store.dart';
import 'package:kyan/screen/profile_screen/profie_screen.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/images.dart';
import 'package:kyan/theme/shadows.dart';

class MainScreen extends BaseScreen {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends BaseScreenState<MainScreen, MainScreenStore> {
  Widget _bottomNavigationBar() {
    return BaseNavigationBar(
      items: <BaseNavigationBarItem>[
        BaseNavigationBarItem(
          icon: Images.iconTask,
          title: S.current.task,
        ),
        BaseNavigationBarItem(
          icon: Images.iconChat,
          title: S.current.chat,
        ),
        BaseNavigationBarItem(
          icon: Images.iconBot,
          title: S.current.bot,
        ),
        BaseNavigationBarItem(
          icon: Images.iconWorkspace,
          title: S.current.profile,
        ),
      ],
      indexSlelected: store.indexTabBar,
      selectedColor: AppColors.primary,
      color: AppColors.gray,
      onItemSelected: (int index) {
        store.setIndexTabBar(value: index);
        store.pageController.jumpToPage(index);
      },
      radius: 26,
      isShowText: false,
      boxShadow: Shadows.shadow3,
    );
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBody: true,
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      drawer: const ProfileScreen(),
      drawerScrimColor: AppColors.transparent,
      bottomNavigationBar: Observer(builder: (_) {
        return _bottomNavigationBar();
      }),
      body: PageView(
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        controller: store.pageController,
        onPageChanged: (int indexPage) {
          store.indexTabBar = indexPage;
        },
        physics: const ScrollPhysics(),
        children: store.screens,
      ),
      floatingActionButton: Observer(
        builder: (_) {
          if (store.workspaceId != null)
            return FloatingActionButton(
              onPressed: () => store.onPressedAddTask(context),
              tooltip: S.current.createTask,
              child: const Icon(Icons.add),
              backgroundColor: AppColors.primary,
            );
          else
            return const SizedBox.shrink();
        },
      ),
    );
  }
}
