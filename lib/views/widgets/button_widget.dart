// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Widgets
import 'add_new_dialog_widget.dart';

// ButtonWidget: StatelessWidget Class
class ButtonWidget extends StatelessWidget {
  // Constructor
  const ButtonWidget({Key? key}) : super(key: key);

  // Action: Class Methods
  void _onClickedButton(BuildContext context) {
    print("Hello Button!");
    showDialog(
      context: context,
      builder: (BuildContext _) {
        return AlertDialog(
          title: const Text(
            "Add New Programmer",
            textAlign: TextAlign.center,
          ),
          content: AddNewDialogWidget(),
          alignment: Alignment.center,
        );
      },
    );
  }

  // Build: Override Class Methods
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Container(
      width: 600.0,
      height: 50.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        onPressed: () => _onClickedButton(context), // to show dialog
        child: const Text("Add New Programmer"),
      ),
    );
  }
}
