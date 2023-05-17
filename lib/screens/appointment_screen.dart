import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'operation_sheet.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime today = DateTime.now();
  String? selectedHour;
  late ScrollController _scrollController;
  List<String> hours = List<String>.generate(11, (i) => '${i + 8}:00')
    ..add('18:30');

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent *
            (today.day / DateTime(today.year, today.month + 1, 0).day),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    int daysInMonth = DateTime(today.year, today.month + 1, 0).day;

    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Screen'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Container(
            height: 60,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: daysInMonth,
              itemBuilder: (context, index) {
                DateTime thisDay = DateTime(today.year, today.month, index + 1);
                bool isSelected = thisDay.day ==
                    today.day; // only today is selected by default

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      today = thisDay;
                    });
                  },
                  child: Container(
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(DateFormat('d').format(thisDay)), // day number
                          Text(DateFormat('EEE').format(thisDay)), // day name
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: hours.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedHour = hours[index];
                    });
                    _showOperationBottomSheet(context);
                  },
                  child: GridTile(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: hours[index] == selectedHour
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(child: Text(hours[index])),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _showOperationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return OperationBottomSheet();
      },
    );
  }
}
