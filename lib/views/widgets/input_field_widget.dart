// Flutter: Existing Libraries
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

// InputFieldWidget: StatelessWidget Class
class InputFieldWidget extends StatelessWidget {
  // Final: Class Properties
  final String? initialValue;
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validationFunction;

  // Constructor
  // ignore: use_key_in_widget_constructors
  InputFieldWidget({
    required this.initialValue,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.validationFunction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        autocorrect: false,
        controller: controller,
        validator: validationFunction,
        cursorHeight: 24.0,
        // cursorColor: const Color(0xff784FFE),
        cursorColor: Colors.lightBlue,
        decoration: InputDecoration(
          labelText: labelText,
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
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}
