// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:provider/provider.dart';

// Pages
import 'package:custom_dialog/views/pages/home_page.dart';

// Providers
import 'package:custom_dialog/controllers/providers/programmer_provider.dart';

// Main: Function
void main() {
  // Running Root Class
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProgrammerProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

// MyApp: StatelessWidget Class
class MyApp extends StatelessWidget {
  // Constructor
  const MyApp({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return MaterialApp(
      title: "Custom Dialog Example",
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (_) => const HomePage(),
      },
    );
  }
}
