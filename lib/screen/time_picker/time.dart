import 'package:intl/intl.dart';
import "package:flutter/material.dart";
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:data_time_picker/constant/color.dart';

class TimePickerScreen extends StatefulWidget {
  const TimePickerScreen({super.key});

  @override
  State<TimePickerScreen> createState() => _TimePickerScreenState();
}

class _TimePickerScreenState extends State<TimePickerScreen> {
  TextEditingController timeinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 10,
        title: Text(
          "Time Picker Page",
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
                    controller: timeinput,
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5),
                    //editing controller of this TextField
                    decoration: InputDecoration(
                      labelText: "Select Time",
                      prefixIcon: Icon(Icons.timer, color: tertiary),
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
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      if (pickedTime != null) {
                        print(pickedTime.format(context)); //output 10:51 PM
                        DateTime parsedTime = DateFormat.jm()
                            .parse(pickedTime.format(context).toString());
                        //converting to DateTime so that we can further format on different pattern.
                        // print(parsedTime); //output 1970-01-01 22:53:00.000
                        String formattedTime =
                            DateFormat('HH:mm:ss').format(parsedTime);
                        // print(formattedTime); //output 14:59:00
                        //DateFormat() is from intl package, you can format the time on any pattern you need.
                        setState(() {
                          timeinput.text =
                              formattedTime; //set the value of text field.
                        });
                      } else {
                        MotionToast(
                          height: 30.0,
                          primaryColor: primary,
                          description: Text("You forgot to pick time!!!"),
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
