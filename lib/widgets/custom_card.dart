import 'package:flutter/material.dart';
import 'package:property_app/widgets/custom_circular_iconbutton.dart';
import 'package:property_app/widgets/custom_text.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String count;
  final Widget icon;
  final String backgroundImage;

  const CustomCard({
    required this.title,
    required this.count,
    required this.icon,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
        ),

          child:
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCircularIconButton(icon: icon,
                  backgroundColor:Color.fromRGBO(14, 61, 180, 1),
                  onPressed: () {  },),

                const SizedBox(height: 10),
                 CustomText(
                    title: title,
                    textsize: 18,
                    textcolor: Colors.white,
                    font: FontWeight.bold, textalign: TextAlign.center,
                     align: Alignment.center
                  ),

                const SizedBox(height: 5),

                CustomText(
                  title: count,
                  textsize: 16,
                  textcolor: Colors.white,
                  font: FontWeight.bold, textalign: TextAlign.center,
                    align: Alignment.center
                ),

              ],
            ),
          ),


    );
  }
}