import 'package:flutter/material.dart';
import 'package:islami_app/ahadeth_model.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class AhadethDetails extends StatelessWidget {
  static const String routeName = "Ahadeth Details";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as AhadethModel;
    var provider = Provider.of<MyProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.theme == ThemeMode.light
                  ? "assets/images/background.png"
                  : "assets/images/background_dark.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w200)),
        ),
        body: Card(
          elevation: 13,
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
                    "${args.content[index]}",
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
              itemCount: args.content.length,
            ),
          ),
        ),
      ),
    );
  }
}
