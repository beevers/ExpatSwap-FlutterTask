import 'package:expatswap_fluttertask/data/global_var/global_variable.dart';
import 'package:expatswap_fluttertask/data/utils/notify_utils.dart';
import 'package:expatswap_fluttertask/model/user_model/user_model.dart';
import 'package:expatswap_fluttertask/view/theme/app_color.dart';
import 'package:expatswap_fluttertask/view_model/cloud_firestore_vm.dart';
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
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    dobController = TextEditingController();
    addressController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userDetails = ref.watch(usercrendentialProvider);
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox.shrink(),
          title: const Text("Personal Information"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ClipOval(
                  child: Image.network(
                userDetails?.additionalUserInfo?.profile?['picture'],
                height: 30,
                width: 30,
              )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Signed in as: ",
                        style: AppText.small(color: Colors.black),
                      ),
                      Text(userDetails!.user!.email.toString())
                    ],
                  ),
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
                    color: ref.watch(isUpdateProvider) == true ? red : green,
                    isLoading: false,
                    title: ref.watch(isUpdateProvider) == true
                        ? 'Update Information'
                        : "Save Information",
                    function: () async {
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState!.validate()) {
                        final docId = ref.watch(docIdProvider);
                        ref.watch(isUpdateProvider) == true
                            ? await storageLocator<CloudFirestoreViewModel>()
                                .updateData(
                                    docId: docId,
                                    user: UserModel(
                                        name: nameController.text,
                                        email: emailController.text,
                                        phone: phoneController.text,
                                        dob: dobController.text,
                                        address: addressController.text))
                            : await storageLocator<CloudFirestoreViewModel>()
                                .saveData(
                                    name: nameController.text,
                                    email: emailController.text,
                                    phone: phoneController.text,
                                    dob: dobController.text,
                                    address: addressController.text);

                        ref.read(isUpdateProvider.notifier).state = false;
                        nameController.clear();
                        emailController.clear();
                        phoneController.clear();
                        dobController.clear();
                        addressController.clear();
                        NotifyUtil.showAlert(ref.watch(isUpdateProvider) == true
                            ? 'Information Updated'
                            : "Information Added");
                      }
                    },
                  ),
                  SpaceUtil.h(16),
                  AppButton(
                    isLoading: false,
                    title: "View Information",
                    function: () async {
                      UserModel result =
                          await Get.to(() => const ViewInformationScreen());
                      nameController.text = result.name!;
                      emailController.text = result.email!;
                      phoneController.text = result.phone!;
                      dobController.text = result.dob!;
                      addressController.text = result.address!;
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
