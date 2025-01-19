import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:property_app/widgets/custom_text.dart';
import '../widgets/custom_appbar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _selectedDate;
  late DateTime _currentMonth;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _currentMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);
  }

  List<Widget> _buildCalendarDays() {
    final firstDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final lastDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    final totalDaysInMonth = lastDayOfMonth.day;

    final startingDay = firstDayOfMonth.weekday;
    final daysList = <Widget>[];

    for (var i = 0; i < startingDay; i++) {
      daysList.add(Container());
    }

    for (var day = 1; day <= totalDaysInMonth; day++) {
      final date = DateTime(_currentMonth.year, _currentMonth.month, day);
      daysList.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = date;
            });
          },
          child: Container(
            margin: EdgeInsets.all(4.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: _selectedDate.day == date.day ? Color.fromRGBO(14, 61, 180, 1) : Colors.transparent,
              borderRadius:BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '$day',
                style: TextStyle(
                  fontWeight: _selectedDate.day == date.day ? FontWeight.bold : FontWeight.normal,
                  color: _selectedDate.day == date.day ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return daysList;
  }

  Widget _buildMonthHeader() {
    final monthName = DateFormat('MMMM yyyy').format(_currentMonth);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              setState(() {
                _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
              });
            },
          ),
          Text(
            monthName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: () {
              setState(() {
                _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWeekdaysRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildDayOfWeek("Sat"),
        _buildDayOfWeek("Sun"),
        _buildDayOfWeek("Mon"),
        _buildDayOfWeek("Tue"),
        _buildDayOfWeek("Wed"),
        _buildDayOfWeek("Thu"),
        _buildDayOfWeek("Fri"),
      ],
    );
  }

  Widget _buildDayOfWeek(String day) {
    return Expanded(
      child: Center(
        child: Text(
          day,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'التقويم',
        backgroundColor: Colors.white,

      ),
      body: Column(
        children: [
          _buildMonthHeader(),
          _buildWeekdaysRow(),
          GridView.count(
            crossAxisCount: 7,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            shrinkWrap: true,
            children: _buildCalendarDays(),
          ),
          
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
             // padding: EdgeInsets.only(right: 5,left: 5),
              height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,  // Background color
                  borderRadius: BorderRadius.circular(5),  // Rounded corners

                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(
                        title: ' < عرض ',
                        textsize: 18, textcolor: Colors.white,
                        font: FontWeight.normal,
                        textalign: TextAlign.right),

                    CustomText(
                        title: 'مستحقات متأخرة من شهور سابقة',
                        textsize: 20, textcolor: Colors.white,
                        font: FontWeight.bold,
                        textalign: TextAlign.right),

                   ]
                )
                ),
          ),
          SizedBox(height: 5,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
                title: 'المستحقات',
                textsize: 24, textcolor: Colors.black,
                font: FontWeight.bold,
                textalign: TextAlign.right),
          ),

          Image.asset('lib/assets/images.jpeg'),


      SizedBox(height: 5,),
      CustomText(
            title: '! عفوا',
            textsize: 24, textcolor: Colors.black,
            font: FontWeight.bold,
            textalign: TextAlign.center,align: Alignment.center,),

          CustomText(
            title: 'لا يوجد مستحقات اليوم',
            textsize: 22, textcolor: Color.fromRGBO(181, 181, 181, 1),
            font: FontWeight.normal,
            textalign: TextAlign.center,align: Alignment.center,),


        ],
      ),
    );
  }
}