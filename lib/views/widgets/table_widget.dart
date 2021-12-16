// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Widgets
import './table_header_widget.dart';
import './table_body_widget.dart';

// TableWidget: StatelessWidget Class
class TableWidget extends StatelessWidget {
  // Constructor
  const TableWidget({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Container(
      width: 610.0,
      height: 610.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableHeaderWidget(),
          const Divider(
            color: Colors.black,
          ),
          const SingleChildScrollView(
            child: TableBodyWidget(),
          )
        ],
      ),
    );
  }
}
