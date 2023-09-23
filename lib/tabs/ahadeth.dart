import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ahadeth_details.dart';
import 'package:islami_app/ahadeth_model.dart';
import 'package:islami_app/my_theme.dart';

class AhadethTap extends StatefulWidget {
  static const String routeName = "ahadeth";

  @override
  State<AhadethTap> createState() => _AhadethTapState();
}

class _AhadethTapState extends State<AhadethTap> {
  List<AhadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadAhadeth();
    }
    return Column(
      children: [
        Image.asset("assets/images/ahadeth_image.png"),
        Divider(
          thickness: 2,
          color: MyTheme.primary,
        ),
        Text("الأحاديث", style: Theme.of(context).textTheme.bodyMedium),
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
                          arguments: allAhadeth[index]);
                    },
                    child: Text(
                      allAhadeth[index].title,
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
              itemCount: allAhadeth.length),
        )
      ],
    );
  }

  loadAhadeth() async {
    rootBundle.loadString("assets/files/ahadeth.txt").then((ahadeth) {
      List<String> ahadethList = ahadeth.split("#");
      for (int i = 0; i < ahadethList.length; i++) {
        String hadethOne = ahadethList[i];
        //(ممكن تضيف قبل الاسبليت دوت تريم وده عشان يشيل السطر الفاضى قبل او بعد الحديث علطول)
        List<String> hadethOneLines = hadethOne.trim().split("\n");
        String title = hadethOneLines[0];
        hadethOneLines.removeAt(0);
        List<String> content = hadethOneLines;
        AhadethModel ahadethModel = AhadethModel(title, content);
        allAhadeth.add(ahadethModel);
      }
      setState(() {});
    }).catchError((e) {
      print(e.toString());
    });
  }
}
