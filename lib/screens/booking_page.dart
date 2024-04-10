import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tuto_doctor_appointement/components/custom_appbar.dart';
import 'package:tuto_doctor_appointement/utils/config.dart';


class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Book Appointment',
        icon: const FaIcon(Icons.arrow_back_ios),
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        clipBehavior: Clip.none,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                //display table calendar
                _tableCalendar(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  child: Center(
                    child: Text(
                      'Select Consultation Time',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _isWeekend ? SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15), 
              child: const Text(
                'Sorry, we are not available on weekends\nPlease enter a date that is not on a weekend',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
            ),
          ): SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                    _timeSelected = true;
                  });
                },
                child: index +9 <= 17 ? Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _currentIndex == index 
                      ? Colors.white 
                      : Colors.black
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: _currentIndex == index ? Config.primaryColor : null,

                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 9}:00 ${index +9 > 11 ? 'PM' : 'AM'}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _currentIndex == index ? Colors.white : null
                    ),
                  ),
                ): null,
              );
            }),

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.5
            ),
          
          )
        ],
      ),
    );
  }

  // table Calendar
  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.utc(1969,1,1),
      lastDay: DateTime.utc(2024, 5, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 40,
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Config.primaryColor,
          shape: BoxShape.circle
        ),
        todayTextStyle: TextStyle(color: Colors.white)
      ),
      availableCalendarFormats: const{
        CalendarFormat.month: 'Month',
        // CalendarFormat.week: 'Week',
        // CalendarFormat.twoWeeks: '2 Weeks'
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _dateSelected = true;
          _focusDay = focusedDay;
          _currentDay = selectedDay;

          if(selectedDay.weekday == 6 || selectedDay.weekday == 7){
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          }else{
            _isWeekend = false;
          }
        });
      },

    );
  }
}

