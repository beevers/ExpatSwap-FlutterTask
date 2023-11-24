import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../../../data/controllers/form_controller/text_form_cont.dart';
import '../../../data/controllers/key/form_keys.dart';
import '../../../data/dependency_injection/injection_container.dart';
import '../../../data/helper/validation_helper.dart';
import '../../../data/utils/space_utils.dart';
import '../../../view_model/date_picker_vm.dart';
import '../../theme/text_style.dart';
import '../../widget/button_widget/app_button.dart';
import '../../widget/form_widget/app_formfield.dart';
import 'view_info_screen.dart';

class PersonalInfoScreen extends ConsumerStatefulWidget {
  const PersonalInfoScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends ConsumerState<PersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox.shrink(),
          title: const Text("Personal Information"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Please fill in the form accordingly here",
                    style: AppText.small(),
                  ),
                  SpaceUtil.h(32),
                  AppFormField(
                    hintText: 'Full Name',
                    validator: (value) => ValidationHelper.isValidString(
                        value.toString(),
                        minLength: 3),
                    controller: nameController,
                  ),
                  SpaceUtil.h(16),
                  AppFormField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'Email',
                    validator: (value) =>
                        ValidationHelper.isValidEmail(value.toString()),
                    controller: emailController,
                  ),
                  SpaceUtil.h(16),
                  AppFormField(
                    keyboardType: TextInputType.phone,
                    hintText: '08067345634',
                    validator: (value) =>
                        ValidationHelper.isValidPhoneNumber(value.toString()),
                    controller: phoneController,
                  ),
                  SpaceUtil.h(16),
                  AppFormField(
                    readOnly: true,
                    hintText: 'Date Of Birth',
                    validator: (value) =>
                        ValidationHelper.isValidInput(value.toString()),
                    controller: dobController,
                    onTap: () async {
                      locator<DatePickerViewModel>().pickDate(context);
                    },
                  ),
                  SpaceUtil.h(16),
                  AppFormField(
                    hintText: 'House Address',
                    validator: (value) => ValidationHelper.isValidInput(
                        value.toString(),
                        minLength: 3),
                    controller: addressController,
                  ),
                  SpaceUtil.h(16),
                  AppButton(
                    isLoading: false,
                    title: "Login",
                    function: () async {
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState!.validate()) {}
                    },
                  ),
                  SpaceUtil.h(16),
                  AppButton(
                    isLoading: false,
                    title: "View Information",
                    function: () async {
                      Get.to(() => const ViewInformationScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    addressController.dispose();

    super.dispose();
  }
}
