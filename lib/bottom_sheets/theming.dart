import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class ThemingBottomSheet extends StatelessWidget {
  const ThemingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.light,
                    style: TextStyle(
                        color: provider.theme == ThemeMode.light
                            ? MyTheme.primary
                            : MyTheme.darkBlack,
                        fontSize: 22.5,
                        fontWeight: FontWeight.w200)),
                provider.theme == ThemeMode.light
                    ? Icon(Icons.done, color: MyTheme.primary, size: 25)
                    : SizedBox.shrink()
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.dark,
                    style: TextStyle(
                        color: provider.theme == ThemeMode.dark
                            ? MyTheme.primary
                            : MyTheme.darkBlack,
                        fontSize: 22.5,
                        fontWeight: FontWeight.w200)),
                provider.theme == ThemeMode.dark
                    ? Icon(Icons.done, color: MyTheme.primary, size: 25)
                    : SizedBox.shrink()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
