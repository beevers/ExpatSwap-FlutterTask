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
                  isLoading: false,
                  function: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
