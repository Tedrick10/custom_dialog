// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:provider/provider.dart';

// Providers
import 'package:custom_dialog/controllers/providers/programmer_provider.dart';

// Models
import 'package:custom_dialog/models/programmer_model.dart';

// Widgets
import './input_field_widget.dart';
import './dropdown_widget.dart';
import './date_time_field_widget.dart';
import './switch_widget.dart';
import './action_button_widget.dart';

// UpdateDialogWidget: StatelessWidget Class
class UpdateDialogWidget extends StatefulWidget {
  // Parameters: Class Properties
  final int index;
  final ProgrammerModel programmerModel;

  // Constructor
  const UpdateDialogWidget({
    required this.index,
    required this.programmerModel,
    Key? key,
  }) : super(key: key);

  @override
  State<UpdateDialogWidget> createState() => _UpdateDialogWidgetState();
}

class _UpdateDialogWidgetState extends State<UpdateDialogWidget> {
  // Final: Class Properties
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final String _nameLabelText = "Name";
  final String _nameHintText = "Enter name";
  final TextEditingController _dateTimeController = TextEditingController();
  final String _dateTimeLabelText = "Date & Time";
  final String _dateTimeHintText = "Enter start study date and time";
  final List<String> _programmingLanguagesList = [
    "Assembly",
    "C++",
    "Dart",
    "F#",
    "Go",
    "Huskell",
    "Java",
    "Kotlin",
    "Swift",
  ];
  final String _switchTitle = "Are you an expert?";
  final String _buttonTitle = "Update";

  // Changable: Class Properties
  String _currentProgrammingLanguage = "Dart";
  bool _switchCurrentValue = false;

  // Lifecycle Hook Methods
  @override
  void initState() {
    super.initState();
    setState(() {
      _nameController.text = widget.programmerModel.name;
      _currentProgrammingLanguage = widget.programmerModel.programmingLanguage;
      _dateTimeController.text = widget.programmerModel.startedDateTime;
      _switchCurrentValue = widget.programmerModel.isExpert;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateTimeController.dispose();
    super.dispose();
  }

  // Action: Class Methods
  dynamic _changeProgrammingLanguage(Object? changedProgrammingLanguage) {
    setState(() {
      _currentProgrammingLanguage = changedProgrammingLanguage.toString();
    });
  }

  void _toggleSwitch(bool changedValue) {
    setState(() {
      _switchCurrentValue = changedValue;
    });
  }

  void updateProgrammer() {
    // Final: Method Properties
    final ProgrammerProvider _programmerProvider = Provider.of(
      context,
      listen: false,
    );

    if (_globalKey.currentState!.validate()) {
      // Final: Method Properties
      final String _programmerName = _nameController.text;
      final String _programmingLanguage = _currentProgrammingLanguage;
      final String _startedDateTime = _dateTimeController.text;
      final bool _isExpert = _switchCurrentValue;

      // Create Programmer Model To Update
      ProgrammerModel updatedProgrammer = ProgrammerModel(
        name: _programmerName,
        programmingLanguage: _programmingLanguage,
        startedDateTime: _startedDateTime,
        isExpert: _isExpert,
      );

      // Update Existing Programmer
      _programmerProvider.updateProgrammer(widget.index, updatedProgrammer);

      // Close Dialog
      Navigator.pop(context);
    }
  }

  // Validation: Class Methods
  String? _nameValidation(String? enteredName) {
    if (enteredName == null || enteredName == "") {
      return "Please enter name.";
    }

    return null;
  }

  String? _dateValidation(String? dateValidation) {
    if (dateValidation == null || dateValidation.trim().isEmpty) {
      return "Please enter date.";
    }

    return null;
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Container(
      child: Form(
        key: _globalKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InputFieldWidget(
                initialValue: "",
                controller: _nameController,
                labelText: _nameLabelText,
                hintText: _nameHintText,
                validationFunction: _nameValidation,
              ),
              DropdownWidget(
                currentValue: _currentProgrammingLanguage,
                itemList: _programmingLanguagesList,
                function: _changeProgrammingLanguage,
              ),
              DateTimeFieldWidget(
                controller: _dateTimeController,
                labelText: _dateTimeLabelText,
                hintText: _dateTimeHintText,
                validation: _dateValidation,
              ),
              SwitchWidget(
                title: _switchTitle,
                value: _switchCurrentValue,
                function: _toggleSwitch,
              ),
              ActionButtonWidget(
                title: _buttonTitle,
                function: updateProgrammer,
              ),
            ],
          ),
        ),
      ),
      width: 700.0,
      height: 350.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
