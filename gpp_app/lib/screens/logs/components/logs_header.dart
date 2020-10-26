import 'package:flutter/material.dart';
import 'package:gpp_app/util/size_config.dart';
import 'dart:developer' as developer;
import 'package:intl/intl.dart';

class LogsHeader extends StatefulWidget {
  @override
  _LogsHeaderState createState() => _LogsHeaderState();
}

class _LogsHeaderState extends State<LogsHeader> {
  // Default: today's date
  DateTime _selectedDate = DateTime.now();

  String _formatDate(DateTime datetime) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(datetime);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Logging
        developer.log(
          'Logs_header.dart: calendarIconButton tapped',
          name: 'MY.DEBUG',
          level: 10,
        );
        // ShowDatePicker
        _selectDate(context);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.orange,
          ),
          margin: const EdgeInsets.fromLTRB(0, 10.0, 20.0, 10.0),
          padding: const EdgeInsets.all(7.0),
          child: Text(
            _formatDate(_selectedDate),
            textAlign: TextAlign.center,
            style: new TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              // fontSize: getBlockSizeHorizontal(5),
            ),
          ),
        ),
      ),
    );
  }

  IconButton _calendarIconButton() {
    return IconButton(
      icon: Icon(Icons.calendar_today),
      tooltip: '배변 기록 확인할 일자를 선택하세요.',
      color: Colors.black,
      iconSize: getBlockSizeVertical(3),
      onPressed: () {
        // Logging
        developer.log(
          'Logs_header.dart: calendarIconButton tapped',
          name: 'MY.DEBUG',
          level: 10,
        );
        // ShowDatePicker
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate, // Refer step 1
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      helpText: '기록을 확인할 날짜를 선택하세요.',
      locale: Locale('ko', 'KO'),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }
}
