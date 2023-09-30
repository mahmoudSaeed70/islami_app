import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
              //(ده لو انت عايزه يقفل اوتوماتيك بعد الإختيار)
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.english,
                    style: TextStyle(
                        color: provider.local == "en"
                            ? MyTheme.primary
                            : MyTheme.darkBlack,
                        fontSize: 22.5,
                        fontWeight: FontWeight.w200)),
                provider.local == "en"
                    ? Icon(Icons.done, color: MyTheme.primary, size: 25)
                    : SizedBox.shrink()
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.arabic,
                    style: TextStyle(
                        color: provider.local == "ar"
                            ? MyTheme.primary
                            : MyTheme.darkBlack,
                        fontSize: 22.5,
                        fontWeight: FontWeight.w200)),
                provider.local == "ar"
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
