import 'package:data_time_picker/screen/date_picker/date.dart';
import 'package:data_time_picker/screen/time_picker/time.dart';
import "package:flutter/material.dart";
import 'package:data_time_picker/constant/color.dart';

class DateTimeButtonPage extends StatefulWidget {
  const DateTimeButtonPage({super.key});

  @override
  State<DateTimeButtonPage> createState() => _DateTimeButtonPageState();
}

class _DateTimeButtonPageState extends State<DateTimeButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(160, 48),
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        foregroundColor: secondary,
                        backgroundColor: cardBg,
                        shadowColor: tertiary),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimePickerScreen()),
                      );
                    },
                    child: Text(
                      "Time Picker",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(160, 48),
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                        foregroundColor: secondary,
                        backgroundColor: cardBg,
                        shadowColor: tertiary),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DatePickerScreen()),
                      );
                    },
                    child: Text(
                      "Date Picker",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
