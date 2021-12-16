// Flutter:: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:getwidget/getwidget.dart';

// DropdownWidget: StatefulWidget Class
class DropdownWidget extends StatefulWidget {
  // Final: Class Properties
  final String currentValue;
  final List<String> itemList;
  final Function(Object?)? function;

  // Constructor
  const DropdownWidget({
    required this.currentValue,
    required this.itemList,
    required this.function,
    Key? key,
  }) : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  // Final: Class Properties
  // final Color _dropdownButtonColor = const Color(0xfff0f5f9);
  final Color _dropdownButtonColor = Colors.lightBlue;

  // Changable: Class Properties
  // Object? dropdownValue = "Terra";

  // Lifecycle Hook Methods
  @override
  initState() {
    super.initState();
  }

  // Widgets: Class Properties
  Widget _networkMenuButton(imageName, title) {
    // Final: Class Properties
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  // Build Method
  @override
  Widget build(BuildContext context) {
    // Final: Class Properties
    final _screenWidth = MediaQuery.of(context).size.width;
    final _screenHeight = MediaQuery.of(context).size.height;

    // Returning Widgets
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: _dropdownButtonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: DropdownButtonHideUnderline(
        child: GFDropdown<Object?>(
          style: Theme.of(context).textTheme.bodyText1,
          dropdownButtonColor: _dropdownButtonColor,
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          value: widget.currentValue,
          items: widget.itemList.map<DropdownMenuItem<dynamic>>((dynamic item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: widget.function,
        ),
      ),
    );
  }
}
