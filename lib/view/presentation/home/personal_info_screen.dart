import 'package:expatswap_fluttertask/data/utils/space_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/controllers/form_controller/text_form_cont.dart';
import '../../../data/helper/validation_helper.dart';
import '../../theme/text_style.dart';
import '../../widget/button_widget/app_button.dart';
import '../../widget/form_widget/app_formfield.dart';

class PersonalInfoScreen extends ConsumerStatefulWidget {
  const PersonalInfoScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends ConsumerState<PersonalInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Information"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Please fill in the form accordingly here",
                  style: RecipeText.small(),
                ),
                SpaceUtil.h(32),
                AppFormField(
                  hintText: 'Full Name',
                  validator: (value) =>
                      ValidationHelper.isValidString(value.toString()),
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
                  hintText: 'Date Of Birth',
                  validator: (value) =>
                      ValidationHelper.isValidInput(value.toString()),
                  controller: dobController,
                  onTap: () async {
                    DateTime? date = (await showDatePicker(
                      context: context,
                      initialDate:
                          DateTime.now().subtract(const Duration(days: 5136)),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 29280)),
                      lastDate:
                          DateTime.now().subtract(const Duration(days: 3979)),
                    ));
                    if (date != null) {
                      dobController.text =
                          "${date.year}-${date.month}-${date.day}";
                    }
                  },
                ),
                SpaceUtil.h(16),
                AppFormField(
                  hintText: 'House Address',
                  validator: (value) =>
                      ValidationHelper.isValidInput(value.toString()),
                  controller: addressController,
                ),
                SpaceUtil.h(16),
                AppButton(
                  isLoading: false,
                  title: "Login",
                  function: () async {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                SpaceUtil.h(16),
                AppButton(
                  isLoading: false,
                  title: "View Information",
                  function: () async {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
