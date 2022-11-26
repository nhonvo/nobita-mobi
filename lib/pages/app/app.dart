import 'package:coder0211/coder0211.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:nobita/l10n/support_locale.dart';
import 'package:nobita/manager/manager_address.dart';
import 'package:nobita/manager/manager_path_routes.dart';
import 'package:nobita/manager/manager_provider.dart';
import 'package:nobita/pages/app/store/app_store.dart';
import 'package:nobita/generated/l10n.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    BaseAPI.domain = ManagerAddress.domain;
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
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
    return GestureDetector(
      onTap: () {
        BaseUtils.hideKeyboard(context);
      },
      child: MultiProvider(
          //MANAGERS PROVIDER ALL APP
          providers: [
            ...ManagerProvider.provider,
          ],
          child: Consumer<AppStore>(builder: (_, store, __) {
            store.getTheme();
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
                  color: store.currentTheme.primaryColor,
                  initialRoute: ManagerRoutes.splash,
                  debugShowCheckedModeBanner: false,
                  useInheritedMediaQuery: true,
                  theme: store.currentTheme,
                  //MANAGERS ROUTES ALL APP
                  routes: {
                    ...ManagerRoutes.manager,
                  },
                  localeResolutionCallback: (locale, supportedLocales) {
                    for (var supportedLocale in supportedLocales) {
                      if (supportedLocale.languageCode ==
                              locale?.languageCode &&
                          supportedLocale.countryCode == locale?.countryCode) {
                        return supportedLocale;
                      }
                    }
                    return supportedLocales.first;
                  });
            });
          })),
    );
  }
}
