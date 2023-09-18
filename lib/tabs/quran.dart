import 'package:flutter/material.dart';
import 'package:islami_app/my_theme.dart';
import 'package:islami_app/sura_details.dart';
import 'package:islami_app/sura_model.dart';

class QuranTap extends StatelessWidget {
  static const String routeName = "quran";
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/quran_image.png"),
        Divider(
          thickness: 2,
          color: MyTheme.primary,
        ),
        Text("اسماء السور", style: Theme.of(context).textTheme.bodyMedium),
        Divider(
          thickness: 2,
          color: MyTheme.primary,
        ),

        //(listView with column u have to wrap it with expanded)
        //(ListView.separated have three parts 1-itemBuilder: 2-separatorBuilder: 3-itemCount:)
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SuraDetailes.routeName,
                          //(طالما هتروح من صفحة لصفحة وعايزه يشيل داتا معينة يبقى من الافضل انك تعمل بيهم موديل وتبعنهم هنا)
                          arguments: SuraModel(suraNames[index], index));
                    },
                    child: Text(
                      suraNames[index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ));
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 1,
                  color: MyTheme.primary,
                  endIndent: 50,
                  indent: 50,
                );
              },
              itemCount: suraNames.length),
        ),
      ],
    );
  }
}
