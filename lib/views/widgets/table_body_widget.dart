// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:provider/provider.dart';

// Providers
import 'package:custom_dialog/controllers/providers/programmer_provider.dart';

// Models
import 'package:custom_dialog/models/programmer_model.dart';

// Widgets
import './delete_button_widget.dart';
import './update_dialog_widget.dart';

// TableBodyWidget: StatelessWidget Class
class TableBodyWidget extends StatelessWidget {
  // Constructor
  const TableBodyWidget({Key? key}) : super(key: key);

  // Widgets: Class Methods
  Widget _tableCell(String cellName) {
    return Container(
      width: 100.0,
      height: 50.0,
      alignment: Alignment.center,
      child: Text(
        cellName,
        textAlign: TextAlign.center,
      ),
    );
  }

  // Action: Class Methods
  void _deleteProgrammer(
    BuildContext context,
    int index,
  ) {
    // Final: Method Properties
    final ProgrammerProvider _programmerProvider =
        Provider.of<ProgrammerProvider>(
      context,
      listen: false,
    );

    _programmerProvider.deleteProgrammer(index);
  }

  // Widget: Class Methods
  void _onClickedButton(
    BuildContext context,
    int index,
    ProgrammerModel programmer,
  ) {
    print("Hello Button!");
    showDialog(
      context: context,
      builder: (BuildContext _) {
        return AlertDialog(
          title: const Text(
            "Add New Programmer",
            textAlign: TextAlign.center,
          ),
          content:
              UpdateDialogWidget(index: index, programmerModel: programmer),
          alignment: Alignment.center,
        );
      },
    );
  }

  // Build: Override Class Properties
  @override
  Widget build(BuildContext context) {
    // Final: Method Properties
    final ProgrammerProvider _programmerProvider =
        Provider.of<ProgrammerProvider>(context);
    final List<ProgrammerModel> _programmersList =
        _programmerProvider.getProgrammersList();

    // Returning Widgets
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          for (int i = 0; i < _programmersList.length; i++) ...[
            InkWell(
              onTap: () {
                _onClickedButton(context, i, _programmersList[i]);
              },
              child: Row(
                children: [
                  _tableCell((i + 1).toString()),
                  _tableCell(_programmersList[i].name),
                  _tableCell(_programmersList[i].programmingLanguage),
                  _tableCell(_programmersList[i].startedDateTime),
                  _tableCell(
                    _programmersList[i].isExpert ? "Yes" : "No",
                  ),
                  DeleteButtonWidget(function: () {
                    _deleteProgrammer(context, i);
                  }),
                ],
              ),
            ),
            const Divider(),
          ],
        ],
      ),
    );
  }
}
