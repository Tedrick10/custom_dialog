// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// TableHeaderWidget: StatelessWidget Class
class TableHeaderWidget extends StatelessWidget {
  // Constructor
  TableHeaderWidget({Key? key}) : super(key: key);

  // Final: Class Properties
  final List<String> _headersList = [
    "#",
    "Name",
    "Language",
    "Started Date",
    "Expert",
    ""
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: Row(
        children: _headersList
            .map(
              (header) => Container(
                width: 100.0,
                height: 50.0,
                alignment: Alignment.center,
                child: Text(
                  header,
                  textAlign: TextAlign.center,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
