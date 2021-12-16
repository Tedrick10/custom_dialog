// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Widgets
import 'package:custom_dialog/views/widgets/button_widget.dart';
import 'package:custom_dialog/views/widgets/table_widget.dart';

// HomePage: StatelessWidget Class
class HomePage extends StatelessWidget {
  // Static: Class Properties
  static String title = "Home";
  static String route = "/home";

  // Constructor
  const HomePage({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ButtonWidget(),
            TableWidget(),
          ],
        ),
      ),
    );
  }
}
