import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'operation_sheet.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime selectedDay = DateTime.now();
  String selectedHour = '';

  final List<String> hours = List.generate(
      11, (index) => (8 + index).toString().padLeft(2, '0') + ':00');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildDaySelector(),
          _buildHourSelector(),
        ],
      ),
    );
  }

  Widget _buildDaySelector() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: DateTime.now().add(const Duration(days: 30)).day,
        itemBuilder: (context, index) {
          DateTime day = DateTime.now().add(Duration(days: index));
          bool isSelected = selectedDay.day == day.day &&
              selectedDay.month == day.month &&
              selectedDay.year == day.year;
          return _DayItem(
            day: day,
            isSelected: isSelected,
            onSelect: (selectedDay) {
              setState(() {
                this.selectedDay = selectedDay;
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildHourSelector() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(hours.length, (index) {
          return _HourItem(
            hour: hours[index],
            isSelected: selectedHour == hours[index],
            onSelect: (selectedHour) {
              setState(() {
                this.selectedHour = selectedHour;
              });
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return OperationBottomSheet();
                },
              );
            },
          );
        }),
      ),
    );
  }
}

class _DayItem extends StatelessWidget {
  final DateTime day;
  final bool isSelected;
  final ValueChanged<DateTime> onSelect;

  _DayItem({
    required this.day,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(day),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('dd').format(day),
              style: TextStyle(
                  fontSize: 20,
                  color: isSelected ? Colors.white : Colors.black),
            ),
            Text(
              DateFormat('EEE').format(day),
              style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class _HourItem extends StatelessWidget {
  final String hour;
  final bool isSelected;
  final ValueChanged<String> onSelect;

  _HourItem({
    required this.hour,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(hour),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            hour,
            style: TextStyle(
                fontSize: 20, color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
