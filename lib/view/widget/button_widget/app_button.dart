import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/text_style.dart';

class AppButton extends ConsumerWidget {
  final String? imageTitle;
  final bool isLoading;
  final String? title;
  final Function()? function;
  final Color color;
  const AppButton(
      {required this.isLoading,
      this.title,
      this.imageTitle,
      required this.function,
      this.color = const Color(0xff1FCC79),
      super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            minimumSize: Size(310.w, 56.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90.r))),
        onPressed: function,
        child: isLoading
            ? const SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : imageTitle == null
                ? Text(
                    title.toString(),
                    style: AppText.small(color: Colors.white),
                  )
                : Image.asset(
                    imageTitle.toString(),
                    scale: 2,
                  ));
  }
}
