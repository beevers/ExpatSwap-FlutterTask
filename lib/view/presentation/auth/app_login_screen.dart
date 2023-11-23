import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final isObscure = StateProvider<bool>((ref) {
    return false;
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 107),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ExpatSwap",
                    style: RecipeText.big(),
                  ),
                  SpaceUtil.h(8),
                  Text(
                    "Welcome Back!",
                    style: RecipeText.big(),
                  ),
                  SpaceUtil.h(8),
                  Text(
                    "Please Sign using your google account here",
                    style: RecipeText.small(),
                  ),
                  SpaceUtil.h(128),
                  AppButton(
                      imageTitle: "assets/images/google.png",
                      color: red,
                      isLoading: false,
                      function: () {},
                      isLarge: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
