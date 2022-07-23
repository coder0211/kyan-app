import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/l10n/support_locale.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/manager/manager_provider.dart';
import 'package:kyan/theme/colors.dart';
import 'package:kyan/utils/utils.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_AppState>();
    state?.setLocale(newLocale);
  }

  static void restartApp(BuildContext context) {
    ManagerProvider.dispose(context);
    context.findAncestorStateOfType<_AppState>()?.restartApp();
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Key key = UniqueKey();
  late Locale _locale;

  @override
  void initState() {
    _locale = const Locale('en');
    BaseAPI.domain = ManagerAddress.domain;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    Utils.getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        //MANAGERS PROVIDER ALL APP
        providers: [
          ...ManagerProvider.provider,
        ],
        child: KeyedSubtree(
          key: key,
          child: MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: _locale,
            supportedLocales: L10n.support,
            color: AppColors.primary,
            initialRoute: ManagerRoutes.splashScreen,
            debugShowCheckedModeBanner: false,
            //MANAGERS ROUTES ALL APP
            routes: {
              ...ManagerRoutes.manager,
            },
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode &&
                    supportedLocale.countryCode == locale?.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
          ),
        ));
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }
}
