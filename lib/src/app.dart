import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:neoflex_quiz/src/quiz/_quiz.dart';
import 'package:neoflex_quiz/src/settings/settings_controller.dart';
import 'package:neoflex_quiz/src/settings/settings_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({required this.settingsController, super.key});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en', '')],

          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  default:
                    return const QuizPage();
                }
              },
            );
          },
        );
      },
    );
  }
}
