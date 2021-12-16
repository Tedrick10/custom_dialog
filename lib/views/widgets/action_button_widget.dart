// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// ActionButtonWidget: StatelessWidget Class
class ActionButtonWidget extends StatelessWidget {
  // Parameter: Class Properties
  final String title;
  final void Function() function;

  const ActionButtonWidget({
    required this.title,
    required this.function,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ElevatedButton(
        onPressed: function,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
