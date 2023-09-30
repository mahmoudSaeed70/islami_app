import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/providers/sura_detailes_provider.dart';
import 'package:islami_app/sura_model.dart';
import 'package:provider/provider.dart';

class SuraDetailes extends StatefulWidget {
  static const String routeName = "Sura Details";

  @override
  State<SuraDetailes> createState() => _SuraDetailesState();
}

class _SuraDetailesState extends State<SuraDetailes> {

  @override
  Widget build(BuildContext context) {
    //(تستلم البيانات هنا يشوف المعلومات الى جاية من الصفحة التانية بعين الموديل الى انت عملته)
    //(الاستلام بيبقى اول سطر جوة البيلد)
    var provider = Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    // loadFile(args.index);
    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..loadFile(args.index),
      builder: (context, child) {
        var suraProvider = Provider.of<SuraDetailsProvider>(context);
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(provider.theme == ThemeMode.light
                      ? "assets/images/background.png"
                      : "assets/images/background_dark.png"),
                  fit: BoxFit.fill)),
          child: Scaffold(
            appBar: AppBar(
              title: Text(args.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w200)),
            ),
            body: Card(
              elevation: 14,
              color: provider.theme == ThemeMode.light
                  ? MyTheme.whiteColor
                  : MyTheme.darkPrimary,
              margin: EdgeInsets.all(18),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: MyTheme.primary)),
              child: Padding(
                padding: EdgeInsets.all(18),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        "${suraProvider.verses[index]} (${index + 1})",
                        textAlign: TextAlign.center,
                        style: provider.theme == ThemeMode.light
                            ? Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w100)
                            : TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w100,
                                color: MyTheme.darkYellow),
                      ),
                    );
                  },
                  itemCount: suraProvider.verses.length,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
