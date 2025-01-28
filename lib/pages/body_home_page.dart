
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_text.dart';

class BodyHomePage extends StatelessWidget {
  const BodyHomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return SafeArea( // Ensures the content is not overlapped by system UI
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 30,
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    title: 'إحصائياتك',
                    textsize: 24,
                    textcolor: Colors.black,
                    font: FontWeight.bold,
                    textalign: TextAlign.right,
                    align: Alignment.centerRight,
                  ),
                ),
              ),

              // GridView inside SingleChildScrollView
              GridView.count(
                shrinkWrap: true,
                // Makes GridView take only as much space as needed
                crossAxisCount: 2,
              //  padding: const EdgeInsets.all(2),
                childAspectRatio: 2 / 2,
                children: [
                  CustomCard(
                    title: 'الوحدات الفارغة',
                    count: '20',
                    icon: Image.asset('lib/assets/image1.png'),
                    backgroundImage: 'lib/assets/images.jpeg',
                  ),
                  CustomCard(
                    title: 'الوحدات المشغولة',
                    count: '60',
                    icon: Image.asset('lib/assets/image2.png'),
                    backgroundImage: 'lib/assets/images2.png',
                  ),
                  CustomCard(
                    title: 'السندات',
                    count: '120',
                    icon: Image.asset('lib/assets/image3.png'),
                    backgroundImage: 'lib/assets/images2.png',
                  ),
                  CustomCard(
                    title: 'العقود',
                    count: '60',
                    icon: Image.asset('lib/assets/image4.png'),
                    backgroundImage: 'lib/assets/images.jpeg',
                  ),
                  CustomCard(
                    title: 'الوحدات المشغولة',
                    count: '60',
                    icon: Image.asset('lib/assets/image5.png'),
                    backgroundImage: 'lib/assets/images2.png',
                  ),
                  CustomCard(
                    title: 'السندات',
                    count: '120',
                    icon: Image.asset('lib/assets/image6.png'),
                    backgroundImage: 'lib/assets/images.jpeg',
                  ),
                ],
              ),

              // Padding and flexible Card container
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                // Added extra bottom padding here
                child: CustomCard(
                  title: 'الوحدات الفارغة',
                  count: '20',
                  icon: Image.asset('lib/assets/image1.png'),
                  backgroundImage: 'lib/assets/images.jpeg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



