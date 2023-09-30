import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/tabs/ahadeth.dart';
import 'package:islami_app/tabs/quran.dart';
import 'package:islami_app/tabs/radio.dart';
import 'package:islami_app/tabs/sebha.dart';
import 'package:islami_app/tabs/settings.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
            provider.theme == ThemeMode.light
                ? "assets/images/background.png"
                : "assets/images/background_dark.png",
            width: double.infinity,
            fit: BoxFit.fill),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.appTitle,
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/quran.png")),
                    label: AppLocalizations.of(context)!.quran,
                    backgroundColor: provider.theme == ThemeMode.light
                        ? MyTheme.primary
                        : MyTheme.darkPrimary),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/ahadeth.png")),
                    label: AppLocalizations.of(context)!.ahadethI,
                    backgroundColor: provider.theme == ThemeMode.light
                        ? MyTheme.primary
                        : MyTheme.darkPrimary),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: AppLocalizations.of(context)!.sebha,
                    backgroundColor: provider.theme == ThemeMode.light
                        ? MyTheme.primary
                        : MyTheme.darkPrimary),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: AppLocalizations.of(context)!.radio,
                    backgroundColor: provider.theme == ThemeMode.light
                        ? MyTheme.primary
                        : MyTheme.darkPrimary),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings,
                    backgroundColor: provider.theme == ThemeMode.light
                        ? MyTheme.primary
                        : MyTheme.darkPrimary)
              ]),
          body: tabs[index],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTap(),
    AhadethTap(),
    SebhaTap(),
    RadioTap(),
    SettingsTap()
  ];
}
