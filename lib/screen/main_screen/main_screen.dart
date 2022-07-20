import 'package:coder0211/coder0211.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/screen/main_screen/store/main_screen_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/theme/images.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';

class MainScreen extends BaseScreen {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends BaseScreenState<MainScreen, MainScreenStore> {
  final PageController _pageController = PageController();

  static List<Widget> _screens = <Widget>[
    'A'.d1(),
    'B'.d1(),
    'C'.d1(),
    'D'.d1()
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _bottomNavigationBar() {
    return BaseNavigationBar(
      items: <BaseNavigationBarItem>[
        BaseNavigationBarItem(
          icon: Images.iconTask,
          iconSelected: Images.iconTaskSelected,
          title: S.current.task,
        ),
        BaseNavigationBarItem(
          icon: Images.iconChat,
          iconSelected: Images.iconChatSelected,
          title: S.current.chat,
        ),
        BaseNavigationBarItem(
          icon: Images.iconBot,
          iconSelected: Images.iconBotSelected,
          title: S.current.bot,
        ),
        BaseNavigationBarItem(
          icon: Images.iconProfile,
          iconSelected: Images.iconProfileSelected,
          title: S.current.profile,
        ),
      ],
      indexSlelected: store.indexTabBar,
      selectedColor: AppColors.primary,
      color: AppColors.gray,
      onItemSelected: (int index) {
        store.setIndexTabBar(value: index);
        _pageController.jumpToPage(index);
      },
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
      bottomNavigationBar: Observer(builder: (_) {
        return _bottomNavigationBar();
      }),
      body: PageView(
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        controller: _pageController,
        onPageChanged: (int indexPage) {
          store.indexTabBar = indexPage;
        },
        physics: const ScrollPhysics(),
        children: _screens,
      ),
      floatingActionButton: DraggableFab(
        child: FloatingActionButton(
          onPressed: () => store.onPressedAddTask(context),
          tooltip: S.current.createTask,
          child: const Icon(Icons.add),
          backgroundColor: AppColors.primary,
        ),
      ),
    );
  }
}
