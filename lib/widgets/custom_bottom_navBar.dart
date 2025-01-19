import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        items: [
          // - lib/assets/home.png
          //     - lib/assets/more.png
          //     - lib/assets/property.png
          //     - lib/assets/reports.png
          BottomNavigationBarItem(
            icon: Image.asset('lib/assets/home.png'),
            label: 'الرئيسية',
          ),
           BottomNavigationBarItem(
             icon: Image.asset('lib/assets/property.png'),
             label: 'أملاكي',
          ),
           BottomNavigationBarItem(
            icon: Image.asset('lib/assets/reports.png'),
             label: 'التقارير',
          ),
           BottomNavigationBarItem(
            icon: Image.asset('lib/assets/more.png'),
             label: 'المزيد',

          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        elevation: 8.0,
      ),
    );
  }
}