// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// DeleteButtonWidget: StatelessWidget Class
class DeleteButtonWidget extends StatelessWidget {
  // Parameters: Class Properties
  final void Function() function;

  // Constructor
  const DeleteButtonWidget({
    required this.function,
    Key? key,
  }) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return InkWell(
      onTap: function,
      child: Container(
        width: 80,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }
}
