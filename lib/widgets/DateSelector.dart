import 'package:flutter/material.dart';

class DateSelector extends StatefulWidget {
  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 9, // You can adjust the number of visible dates
              itemBuilder: (BuildContext context, int index) {
                final currentDate = DateTime.now();
                final date = currentDate.add(Duration(days: index));

                // Check if the date is in the past
                final isPastDate = date.isBefore(currentDate);

                // Style for the text based on whether it's the current date or a past date
                final textStyle = TextStyle(
                  fontSize: 20.0,
                  fontFamily: "PlusJakartaSans",
                  color: isPastDate ? Colors.grey : Colors.black,
                  fontWeight: date.day == selectedDate.day
                      ? FontWeight.bold
                      : FontWeight.normal,
                );

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    padding:
                        EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 3),
                    decoration: BoxDecoration(
                      border: date.day == selectedDate.day
                          ? Border(
                              bottom: BorderSide(
                                  width: 3, color: Color(0xFF00A86B)))
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${date.day}',
                          style: textStyle,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${_getWeekdayAbbreviation(date.weekday)}',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  String _getWeekdayAbbreviation(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }
}
