import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/tabs/ahadeth.dart';
import 'package:islami_app/tabs/quran.dart';
import 'package:islami_app/tabs/radio.dart';
import 'package:islami_app/tabs/sebha.dart';
import 'package:islami_app/tabs/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 4;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/background.png",
            width: double.infinity, fit: BoxFit.fill),
        Scaffold(
          appBar: AppBar(
            title: Text("Islami", style: Theme.of(context).textTheme.bodyLarge),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: "الاعدادات",
                    backgroundColor: MyTheme.primary),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: "الراديو",
                    backgroundColor: MyTheme.primary),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: "السبحة",
                    backgroundColor: MyTheme.primary),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/ahadeth.png")),
                    label: "الاحاديث",
                    backgroundColor: MyTheme.primary),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/quran.png")),
                    label: "القران",
                    backgroundColor: MyTheme.primary)
              ]),
          body: tabs[index],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    SettingsTap(),
    RadioTap(),
    SebhaTap(),
    AhadethTap(),
    QuranTap()
  ];
}
