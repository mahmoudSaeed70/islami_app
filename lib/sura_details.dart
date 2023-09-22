import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/sura_model.dart';

class SuraDetailes extends StatefulWidget {
  static const String routeName = "Sura Details";

  @override
  State<SuraDetailes> createState() => _SuraDetailesState();
}

class _SuraDetailesState extends State<SuraDetailes> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    //(تستلم البيانات هنا يشوف المعلومات الى جاية من الصفحة التانية بعين الموديل الى انت عملته)
    //(الاستلام بيبقى اول سطر جوة البيلد)
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    loadFile(args.index);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.name, style: Theme.of(context).textTheme.bodyLarge),
        ),
        body: Card(
          elevation: 14,
          margin: EdgeInsets.all(18),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: MyTheme.primary)),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  "${verses[index]} (${index + 1})",
                  textAlign: TextAlign.center,
                ),
              );
            },
            itemCount: verses.length,
          ),
        ),
      ),
    );
  }

  loadFile(int index) async {
    //(من الافضل انك تحط الكود ده جوه ترى وكاتش عشان لو ملقاش الفايل يطبعلك الايرور)
    try {
      String sura =
          await rootBundle.loadString("assets/files/${index + 1}.txt");
      List<String> lines = sura.split("\n");
      verses = lines;
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }
}