import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property_app/pages/more_page.dart';
import 'package:property_app/pages/property_page.dart';
import 'package:property_app/widgets/custom_floating_Action_Button.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_bottom_navBar.dart';
import '../widgets/custom_circular_iconbutton.dart';
import 'body_home_page.dart';
import 'celander.dart';
import 'reports_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _isActionSelected = false;

  final List<Widget> _screens = [
    BodyHomePage(),
    PropertyPage(),
    ReportsPage(),
    MorePage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ' مرحبا بك , محمد',
        subtitle: 'يمكنك متابعة أملاكك من هنا',
        backgroundColor: Color.fromRGBO(14, 61, 180, 1),
        actions: [
          CustomCircularIconButton(
            icon: Image.asset('lib/assets/celander.png'), // Icon for the button
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarPage()),
              );
            },
          ),
          CustomCircularIconButton(
            icon: Image.asset('lib/assets/bell.png'), // Icon for the button
            onPressed: () {
            },
          ),
        ],
      ),
      body: _screens[_currentIndex],


      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),

      floatingActionButton: CustomFloatingActionButton(
        isActionSelected: _isActionSelected,
        onPressed: () {
          setState(() {
            _isActionSelected = !_isActionSelected;
          });
        },

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


    );
  }
}
