import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:expatswap_fluttertask/data/dependency_injection/injection_container.dart';
import 'package:expatswap_fluttertask/view/presentation/auth/app_login_screen.dart';
import 'package:expatswap_fluttertask/view/presentation/onboarding/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  injectDependency();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(deviceWidth, deviceHeight),
      builder: ((context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: AnimatedSplashScreen(
              duration: 3000,
              splash: const SplashScreen(),
              nextScreen: const AppLoginScreen()),
        );
      }),
    );
  }
}
