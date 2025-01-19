import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property_app/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final List<Widget>? actions;

  CustomAppBar({
    required this.title,
     this.subtitle="",
    this.backgroundColor = Colors.blue,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
         Spacer(flex: 2,),
          Directionality(
            textDirection: TextDirection.rtl,
            child: AppBar(
             toolbarHeight: 110,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              title: Column(
                children: [
                  CustomText(title: title, textsize: 24, textcolor: (backgroundColor == Color.fromRGBO(14, 61, 180, 1)) ? Colors.white : Colors.black, font: FontWeight.bold,
                    textalign: TextAlign.right,align: Alignment.centerRight),
                  CustomText(title: subtitle, textsize: 20,
                      textcolor: Colors.white, font: FontWeight.normal,textalign:
                      TextAlign.right,align: Alignment.centerRight),
                ],
              )
              ,
              backgroundColor: backgroundColor,
              actions: actions,
            
            ),
          ),
          Spacer(flex: 1,)
        ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(118);
}

