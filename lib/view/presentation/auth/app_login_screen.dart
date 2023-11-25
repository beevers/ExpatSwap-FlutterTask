import 'package:expatswap_fluttertask/data/dependency_injection/injection_container.dart';
import 'package:expatswap_fluttertask/data/global_var/global_variable.dart';
import 'package:expatswap_fluttertask/view/presentation/home/personal_info_screen.dart';
import 'package:expatswap_fluttertask/view_model/google_auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../data/utils/space_utils.dart';
import '../../theme/app_color.dart';
import '../../theme/text_style.dart';
import '../../widget/button_widget/app_button.dart';

class AppLoginScreen extends ConsumerStatefulWidget {
  const AppLoginScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppLoginScreenState();
}

class _AppLoginScreenState extends ConsumerState<AppLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 107),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ExpatSwap",
                  style: AppText.big(),
                ),
                SpaceUtil.h(8),
                Text(
                  "Welcome Back!",
                  style: AppText.big(),
                ),
                SpaceUtil.h(8),
                Text(
                  "Please Sign In using your google account here",
                  style: AppText.small(),
                ),
                SpaceUtil.h(128),
                AppButton(
                  imageTitle: "assets/images/google.png",
                  color: red,
                  isLoading: ref.watch(loadingProvider),
                  function: () async {
                    final response = await authLocator<GoogleAuthViewModel>()
                        .signInWithGoogle(ref);
                    ref.read(usercrendentialProvider.notifier).state = response;

                    Get.to(() => const PersonalInfoScreen());
                  },
                ),
                SpaceUtil.h(12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
