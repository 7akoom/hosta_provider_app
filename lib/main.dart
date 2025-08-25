import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' show log;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hosta_provider/core/di/injection_container.dart' as di;
import 'package:hosta_provider/theme/app_theme.dart';
import 'package:hosta_provider/routes/app_routes.dart';
import 'package:hosta_provider/presentation/providers/app_provider.dart';
import 'package:hosta_provider/presentation/providers/notification_provider.dart';
import 'package:hosta_provider/presentation/providers/app_settings_provider.dart';
import 'package:hosta_provider/presentation/providers/auth_provider.dart';
import 'package:hosta_provider/presentation/providers/booking_provider.dart';
import 'package:hosta_provider/generated/app_localizations.dart';
import 'package:hosta_provider/core/localization/kurdish_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  await di.initializeDependencies();

  // Get initial route based on user status
  final prefs = await SharedPreferences.getInstance();

  // في وضع التصحيح، نقوم بمسح التفضيلات عدا اللغة
  if (kDebugMode) {
    // احتفظ باللغة المحددة
    final savedLanguage = prefs.getString('selected_language');
    final savedLanguageSelected = prefs.getBool('language_selected');

    await prefs.clear();

    // أعد حفظ اللغة إذا كانت موجودة
    if (savedLanguage != null && savedLanguageSelected == true) {
      await prefs.setString('selected_language', savedLanguage);
      await prefs.setBool('language_selected', true);
    }

    log('Cleared all preferences except language', name: 'AppInit');
  }

  final hasLanguage = prefs.getString('selected_language') != null;
  final hasToken = prefs.getString('access_token') != null;

  // تسجيل القيم للتحقق في وضع التصحيح
  log(
    'Initial app state - Language: $hasLanguage, Token: $hasToken, Language Value: ${prefs.getString('selected_language')}',
    name: 'AppInit',
  );

  String initialRoute;
  if (!hasLanguage) {
    // First time user - show language selection
    initialRoute = '/';
  } else if (hasToken) {
    // Logged in user - go directly to home
    initialRoute = '/home';
  } else {
    // Has language but no token - go to registration/login
    initialRoute = '/signin';
  }

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => di.getIt<NotificationProvider>(),
          ),
          ChangeNotifierProvider(
            create: (_) => di.getIt<AppSettingsProvider>(),
          ),
          ChangeNotifierProvider(create: (_) => di.getIt<AuthProvider>()),
          ChangeNotifierProvider(create: (_) => di.getIt<BookingProvider>()),
        ],
        child: Consumer<AppSettingsProvider>(
          builder: (context, appSettings, _) {
            final delegates = <LocalizationsDelegate<dynamic>>[
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              KurdishMaterialLocalizations.delegate,
              KurdishCupertinoLocalizations.delegate,
            ];

            return MaterialApp(
              title: 'Hosta Services',
              theme: AppTheme.getLightTheme(context),
              darkTheme: AppTheme.getDarkTheme(context),
              themeMode: appSettings.isDarkMode
                  ? ThemeMode.dark
                  : ThemeMode.light,
              locale: appSettings.locale,
              localizationsDelegates: delegates,
              supportedLocales: const [
                Locale('en'), // English
                Locale('ar'), // Arabic
                Locale('ku'), // Kurdish
              ],
              builder: (context, child) {
                // Set text direction based on locale
                return Directionality(
                  textDirection: appSettings.locale.languageCode == 'en'
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: child!,
                );
              },
              localeResolutionCallback: (locale, supportedLocales) {
                // Check if the current device locale is supported
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale?.languageCode) {
                    return supportedLocale;
                  }
                }
                // If the locale is not supported, return the first supported locale (English)
                return supportedLocales.first;
              },

              initialRoute: initialRoute,
              onGenerateRoute: AppRoutes.generateRoute,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
