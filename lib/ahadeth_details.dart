import 'package:flutter/material.dart';
import 'package:islami_app/ahadeth_model.dart';
import 'package:islami_app/my_theme.dart';

class AhadethDetails extends StatelessWidget {
  static const String routeName = "Ahadeth Details";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as AhadethModel;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title, style: Theme.of(context).textTheme.bodyLarge),
        ),
        body: Card(
          elevation: 13,
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
