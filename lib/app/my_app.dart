import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kwasi/localization/provider/change_lang_provider.dart';
import 'package:kwasi/routes/routes_imports.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  void initState() {
    Provider.of<ChangeLangProvider>(context,listen: false).getLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeLangProvider>(
      builder: (context,provider,child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('fr')
          ],
          locale: provider.locale,
          title: 'Kwasi',
          theme: ThemeData(
            useMaterial3: true,
          ),
          routerConfig: _appRouter.config(),
        );
      }
    );
  }
}
