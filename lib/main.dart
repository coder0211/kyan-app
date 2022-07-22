import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/l10n/support_locale.dart';
import 'package:kyan/manager/locale_provider.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_key_storage.dart';
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
  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_AppState>()?.restartApp();
    ManagerProvider.dispose(context);
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Key key = UniqueKey();

  @override
  void initState() {
    BaseAPI.domain = ManagerAddress.domain;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    BaseUtils.onWidgetBuildDone(function, context);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: MultiProvider(
          //MANAGERS PROVIDER ALL APP
          providers: [
            ChangeNotifierProvider(create: (_) => LocaleProvider()),
            ...ManagerProvider.provider,
          ],
          child: Consumer<LocaleProvider>(builder: (context, provider, child) {
            return MaterialApp(
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: provider.locale,
              supportedLocales: L10n.support,
              color: AppColors.primary,
              initialRoute: ManagerRoutes.splashScreen,
              debugShowCheckedModeBanner: false,
              //MANAGERS ROUTES ALL APP
              routes: {
                ...ManagerRoutes.manager,
              },
            );
          })),
    );
  }

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  Future<void> function() async {
    if (await BaseSharedPreferences.containKey(ManagerKeyStorage.language)) {
      context.read<LocaleProvider>().setLocale(Locale(
          await BaseSharedPreferences.getStringValue(
              ManagerKeyStorage.language)));
    } else {
      context
          .read<LocaleProvider>()
          .setLocale(Locale(await BaseSharedPreferences.getStringValue('en')));
    }
  }
}
