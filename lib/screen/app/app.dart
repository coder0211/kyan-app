import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kyan/const/consts.dart';
import 'package:kyan/generated/l10n.dart';
import 'package:kyan/l10n/support_locale.dart';
import 'package:kyan/manager/manager_address.dart';
import 'package:kyan/manager/manager_path_routes.dart';
import 'package:kyan/manager/manager_provider.dart';
import 'package:kyan/screen/app/store/app_store.dart';
import 'package:kyan/theme/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    ManagerAddress.domain = dotenv.env[DOMAIN] ?? 'http://192.168.118.1:3001';
    BaseAPI.domain = ManagerAddress.domain;
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
        child: Consumer<AppStore>(builder: (_, store, __) {
          store.getLanguage();
          return Observer(builder: (_) {
            return MaterialApp(
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: store.locale,

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
            );
          });
        }));
  }
}
