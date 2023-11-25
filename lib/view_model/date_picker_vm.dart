import 'package:expatswap_fluttertask/data/controllers/form_controller/text_form_cont.dart';
import 'package:expatswap_fluttertask/model/abstracts/date_picker_abstract.dart';
import 'package:flutter/material.dart';

// ViewModel class responsible for handling date picking logic
class DatePickerViewModel
    with ChangeNotifier
    implements DatePickerViewModelInterface {
  @override
  Future<void> pickDate(BuildContext context) async {
    // Show the date picker dialog
    DateTime? date = (await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 5136)),
      firstDate: DateTime.now().subtract(const Duration(days: 29280)),
      lastDate: DateTime.now().subtract(const Duration(days: 3979)),
    ));

    // Check if a date was selected
    if (date != null) {
      // Update the text in the date of birth controller
      dobController.text = "${date.year}-${date.month}-${date.day}";

      // Notify listeners that the state has changed
      notifyListeners();
    }
  }
}
