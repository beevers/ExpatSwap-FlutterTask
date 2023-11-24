import 'package:expatswap_fluttertask/data/controllers/form_controller/text_form_cont.dart';
import 'package:expatswap_fluttertask/model/abstracts/date_picker_abstract.dart';
import 'package:flutter/material.dart';

class DatePickerViewModel
    with ChangeNotifier
    implements DatePickerViewModelInterface {
  @override
  Future<void> pickDate(BuildContext context) async {
    DateTime? date = (await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 5136)),
      firstDate: DateTime.now().subtract(const Duration(days: 29280)),
      lastDate: DateTime.now().subtract(const Duration(days: 3979)),
    ));

    if (date != null) {
      dobController.text = "${date.year}-${date.month}-${date.day}";
      notifyListeners(); // Notify listeners if necessary
    }
  }
}
