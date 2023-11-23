import 'package:expatswap_fluttertask/view_model/date_picker_vm.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void injectDependency() {
  locator.registerSingleton<DatePickerViewModel>(DatePickerViewModel());
}
