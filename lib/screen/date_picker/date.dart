import 'package:intl/intl.dart';
import "package:flutter/material.dart";
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:data_time_picker/constant/color.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 10,
        title: Text("Date Picker Page",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: tertiary, fontSize: 19.5, fontWeight: FontWeight.w500),
        ),
        iconTheme: IconThemeData(color: tertiary),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.0),
                child: Container(
                  child: TextField(
                    controller: dateInput,
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5),
                    //editing controller of this TextField
                    decoration: InputDecoration(
                      //icon of text field
                      labelText: "Select Date",
                      prefixIcon: Icon(Icons.calendar_today, color: tertiary),
                      filled: true,
                      fillColor: cardBg,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      labelStyle: TextStyle(
                          color: secondary,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.4),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        // print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        // print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          dateInput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        MotionToast(
                          height: 30.0,
                          primaryColor: primary,
                          description: Text("You forgot to pick Date!!!"),
                          icon: Icons.timer,
                          animationType: AnimationType.fromLeft,
                        ).show(context);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
