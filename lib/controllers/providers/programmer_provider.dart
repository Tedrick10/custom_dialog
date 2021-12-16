// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Models
import 'package:custom_dialog/models/programmer_model.dart';

// ProgrammerProvider: Provider Class
class ProgrammerProvider with ChangeNotifier {
  // Changable: Class Properties
  final List<ProgrammerModel> _programmersList = [
    ProgrammerModel(
      name: "Amy",
      programmingLanguage: "C++",
      startedDateTime: "2021-12-16T15:41:00",
      isExpert: true,
    ),
    ProgrammerModel(
      name: "KiKi",
      programmingLanguage: "Swift",
      startedDateTime: "2021-12-16T15:41:00",
      isExpert: false,
    ),
  ];

  // CRUD Methods: Class Methods
  void addNewProgrammer(ProgrammerModel newProgrammer) {
    _programmersList.add(newProgrammer);
    notifyListeners();
  }

  List<ProgrammerModel> getProgrammersList() {
    return _programmersList;
  }

  void updateProgrammer(int index, ProgrammerModel updatedProgrammer) {
    _programmersList[index] = updatedProgrammer;
    notifyListeners();
  }

  void deleteProgrammer(int index) {
    _programmersList.removeAt(index);
    notifyListeners();
  }
}
