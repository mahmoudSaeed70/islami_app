import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ahadeth_model.dart';

class AhadethProvider extends ChangeNotifier {
  List<AhadethModel> allAhadeth = [];

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
      notifyListeners();
    }).catchError((e) {
      print(e.toString());
    });
  }
}
