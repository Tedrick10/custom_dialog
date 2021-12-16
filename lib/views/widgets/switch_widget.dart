// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:flutter_switch/flutter_switch.dart';

// SwitchWidget: StatelessWidget Class
class SwitchWidget extends StatelessWidget {
  // Parameters: Class Properties
  final String title;
  final bool value;
  final void Function(bool) function;

  // Constructor
  const SwitchWidget({
    required this.title,
    required this.value,
    required this.function,
    Key? key,
  }) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlutterSwitch(
            width: 100.0,
            height: 50.0,
            value: value,
            onToggle: function,
          ),
        ],
      ),
    );
  }
}
