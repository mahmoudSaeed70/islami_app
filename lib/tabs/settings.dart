import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../bottom_sheets/language.dart';
import '../bottom_sheets/theming.dart';
import '../providers/my_provider.dart';

class SettingsTap extends StatefulWidget {
  static const String routeName = "setting";

  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(
            height: 3,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              margin: EdgeInsets.symmetric(horizontal: 17),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: MyTheme.primary)),
              child: Text(
                  provider.local == "en"
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context).textTheme.bodySmall),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(AppLocalizations.of(context)!.mode,
              style: Theme.of(context).textTheme.bodyMedium),
          InkWell(
            onTap: () {
              showThemingBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              margin: EdgeInsets.symmetric(horizontal: 17),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: MyTheme.primary)),
              child: Text(
                  provider.theme == ThemeMode.light
                      ? AppLocalizations.of(context)!.light
                      : AppLocalizations.of(context)!.dark,
                  style: Theme.of(context).textTheme.bodySmall),
            ),
          ),
        ],
      ),
    );
  }

  showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      //(السطر ده لو عاوز البتوم شيت ياخد الصفحة كلها وتسيب الارتفاع من غير رقم مضروب فيه)
      // isScrollControlled: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(18),
            topLeft: Radius.circular(18),
          ),
          borderSide: BorderSide(color: Colors.transparent)),
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }

  showThemingBottomSheet() {
    showModalBottomSheet(
      context: context,
      //(السطر ده لو عاوز البتوم شيت ياخد الصفحة كلها وتسيب الارتفاع من غير رقم مضروب فيه)
      // isScrollControlled: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(18),
            topLeft: Radius.circular(18),
          ),
          borderSide: BorderSide(color: Colors.transparent)),
      builder: (context) {
        return ThemingBottomSheet();
      },
    );
  }
}
