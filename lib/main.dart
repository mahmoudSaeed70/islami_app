import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/ahadeth_details.dart';
import 'package:islami_app/home.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/splash_screen.dart';
import 'package:islami_app/sura_details.dart';
import 'package:islami_app/tabs/ahadeth.dart';
import 'package:islami_app/tabs/quran.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      //locale: Locale("ar"),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        QuranTap.routeName: (context) => QuranTap(),
        SuraDetailes.routeName: (context) => SuraDetailes(),
        AhadethTap.routeName: (context) => AhadethTap(),
        AhadethDetails.routeName: (context) => AhadethDetails()
      },
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
    );
  }
}
