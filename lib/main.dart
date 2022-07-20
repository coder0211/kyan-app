import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/manager/manager_provider.dart';
import 'package:kyan/theme/colors.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    BaseAPI.domain = ManagerAddress.domain;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //MANAGERS PROVIDER ALL APP
      providers: [
        ...ManagerProvider.provider,
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        color: AppColors.primary,
        initialRoute: ManagerRoutes.profileScreen,
        //MANAGERS ROUTES ALL APP
        routes: {
          ...ManagerRoutes.manager,
        },
      ),
    );
  }
}
