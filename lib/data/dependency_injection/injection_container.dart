import 'package:expatswap_fluttertask/view_model/cloud_firestore_vm.dart';
import 'package:expatswap_fluttertask/view_model/date_picker_vm.dart';
import 'package:expatswap_fluttertask/view_model/google_auth_vm.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
final authLocator = GetIt.instance;
final storageLocator = GetIt.instance;

void injectDependency() {
  locator.registerSingleton<DatePickerViewModel>(DatePickerViewModel());
  authLocator.registerSingleton<GoogleAuthViewModel>(GoogleAuthViewModel());
  storageLocator
      .registerSingleton<CloudFirestoreViewModel>(CloudFirestoreViewModel());
}
