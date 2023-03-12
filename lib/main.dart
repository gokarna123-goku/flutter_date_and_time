import 'package:flutter/material.dart';
import 'package:data_time_picker/screen/date_time_section.dart';

// Without using SharedPreferences
void main() {
  runApp(DateTimePickerApp());
}

class DateTimePickerApp extends StatelessWidget {
  const DateTimePickerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DateTimeButtonPage(),
    );
  }
}