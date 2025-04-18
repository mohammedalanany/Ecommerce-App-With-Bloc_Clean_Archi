import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:round/core/dependency_injection/locator_service.dart';
import 'package:round/core/routes/routes.dart';
import 'package:round/features/auth_feature/splash/pages/splash.dart';
import 'package:round/src/helpers/app_translations.dart';
import 'package:round/src/providers/app_providers.dart';
import 'package:round/src/providers/global/language.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_themes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.getProviders(),
      child: Selector<AppLanguage, String?>(
        selector: (BuildContext context, appLanguage) => appLanguage.language,
        builder: (BuildContext context, language, _) => MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          navigatorKey: LocatorService.navigationService.navigatorKey,
          localizationsDelegates: [
            const AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('en', ''), Locale('ar', '')],
          locale: language != null ? Locale(language, '') : null,
          title: 'Round',
          color: AppColors.primaryColor,
          theme: theme(context, language!),
          home: SplashPage(),
          routes: AppRoutes.routes,
        ),
      ),
    );
  }
}
