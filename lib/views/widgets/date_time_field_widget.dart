// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:date_time_picker/date_time_picker.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// DateTimeFieldWidget: StatelessWidget Class
class DateTimeFieldWidget extends StatefulWidget {
  // Parameter: Class Properties
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  // Constructor
  const DateTimeFieldWidget({
    required this.controller,
    required this.labelText,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  State<DateTimeFieldWidget> createState() => _DateTimeFieldWidgetState();
}

// _DateTimeFieldWidgetState: State Class
class _DateTimeFieldWidgetState extends State<DateTimeFieldWidget> {
  // Final: Class Properties
  final TextEditingController controller = TextEditingController();

  // Build: Class Methods
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
      child: TextFormField(
        cursorHeight: 24.0,
        // cursorColor: const Color(0xff784FFE),
        cursorColor: Colors.lightBlue,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () async {
              var date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (date != null) {
                var time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                );
                print(DateTimeField.combine(date, time).toString());
                final format = DateFormat("yyyy-MM-dd'T'HH:mm:ss");

                widget.controller.text =
                    format.format(DateTimeField.combine(date, time)).toString();
              }
            },
            icon: const Icon(
              Icons.calendar_today_outlined,
              // color: Color(0xff784FFE),
              color: Colors.lightBlue,
            ),
          ),
          labelText: widget.labelText,
          alignLabelWithHint: true,
          labelStyle: Theme.of(context).textTheme.headline6!.copyWith(
                // color: const Color(0xff784FFE),
                color: Colors.lightBlue,
              ),
          // labelStyle: const TextStyle(
          //   color: Color(0xff784FFE),
          // ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              // color: Color(0xff784FFE),
              color: Colors.lightBlue,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          hintText: widget.hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.grey),
          // hintStyle: Theme.of(context).primaryTextTheme.subtitle1!.copyWith(
          //       color: Colors.grey,
          //       fontSize: 18,
          //     ),
        ),
      ),
    );
  }
}
