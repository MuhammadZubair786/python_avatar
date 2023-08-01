import 'package:flutter/material.dart';
import 'package:chatbot_app/export_all.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _listViewIndex = 0;
  List<Map<int, String>> _selectedValues = [{}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (BuildContext context, int dropdownIndex) {
              return DropdownButton<String>(
// _value1.isNotEmpty ? _value1 : null,

                value: _selectedValues[_listViewIndex][dropdownIndex] != null ? _selectedValues[_listViewIndex][dropdownIndex] : null,
                hint: Text('Select value'),
                items: ['Option 1', 'Option 2', 'Option 3'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedValues[_listViewIndex][dropdownIndex] = value.toString();
                  });
                },
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Next'),
              onPressed: () {
                setState(() {
                  _listViewIndex++;
                  _selectedValues.add({});
                });
              },
            ),
            10.horizontalSpace,
            ElevatedButton(
              child: Text('Show'),
              onPressed: () {
                //print(_selectedValues.toString());
              },
            ),
            10.horizontalSpace,
            ElevatedButton(
              child: Text('Clear'),
              onPressed: () {
                _selectedValues.clear();
              },
            )
          ],
        ),
      ],
    )));
  }
}

class DateGet extends StatefulWidget {
  DateGet({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DateGet> {
  String _selectedDate = '';

  void _onCalendarTapped(CalendarTapDetails calendarTapDetails) {
    setState(() {
      _selectedDate = calendarTapDetails.date.toString();
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AnotherScreen(_selectedDate)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),
      ),
      body: SfCalendar(
        onTap: _onCalendarTapped,
      ),
    );
  }
}

// jksdhsakjdhjasjdsajkdjkssajkd

class AnotherScreen extends StatelessWidget {
  final String selectedDate;
  // fdsfsdfsdfds

  AnotherScreen(this.selectedDate);
// zdjsahdjasdjkasjdjaskdjk
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Date'),
      ),
      body: Center(
        child: Text(
          'Selected Date: $selectedDate',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}



// list to store selected values for each item
