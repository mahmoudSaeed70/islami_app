import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/ahadeth_details.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/ahadeth_provider.dart';
import 'package:provider/provider.dart';

class AhadethTap extends StatefulWidget {
  static const String routeName = "ahadeth";

  @override
  State<AhadethTap> createState() => _AhadethTapState();
}

class _AhadethTapState extends State<AhadethTap> {
  @override
  Widget build(BuildContext context) {
    // if (allAhadeth.isEmpty) {
    //   loadAhadeth();
    // }
    return ChangeNotifierProvider(
      create: (context) => AhadethProvider(),
      builder: (context, child) {
        var ahadethProvider = Provider.of<AhadethProvider>(context)
          ..loadAhadeth();
        return Column(
          children: [
            Image.asset("assets/images/ahadeth_image.png"),
            Divider(
              thickness: 2,
              color: MyTheme.primary,
            ),
            Text(AppLocalizations.of(context)!.ahadeth,
                style: Theme.of(context).textTheme.bodyMedium),
            Divider(
              thickness: 2,
              color: MyTheme.primary,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AhadethDetails.routeName,
                              arguments: ahadethProvider.allAhadeth[index]);
                        },
                        child: Text(
                          ahadethProvider.allAhadeth[index].title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall,
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 1,
                      color: MyTheme.primary,
                      indent: 40,
                      endIndent: 40,
                    );
                  },
                  itemCount: ahadethProvider.allAhadeth.length),
            )
          ],
        );
      },
    );
  }
}
