import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double textsize;
  final Color textcolor;
  final FontWeight font;
  final TextAlign textalign;
  final AlignmentGeometry align;

  CustomText({
    required this.title,
    required this.textsize,
    required this.textcolor,
    required this.font,
    required this.textalign,
     this.align=Alignment.centerRight
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align, // Aligns content to the right
      child: Text(title,textAlign:textalign,
        style: TextStyle(color: textcolor,
          fontSize: textsize, fontWeight: font,
        ),),
    );
  }
}



