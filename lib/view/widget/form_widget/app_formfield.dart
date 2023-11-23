import 'package:expatswap_fluttertask/view/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFormField extends ConsumerWidget {
  final bool? readOnly;
  final Function()? suffixAction;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Function()? onTap;
  final IconData? suffixIcon;
  final bool isIcon;
  final bool isObscure;
  final String? iconImage;
  final String title;
  final IconData? prefixIcon;
  const AppFormField({
    this.suffixAction,
    this.readOnly,
    this.onTap,
    required this.isObscure,
    required this.validator,
    required this.controller,
    super.key,
    required this.isIcon,
    this.prefixIcon,
    this.iconImage,
    this.suffixIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: SizedBox(
        width: double.infinity,
        height: 56.h,
        child: TextFormField(
          readOnly: readOnly ?? false,
          onTap: onTap,
          obscureText: isObscure,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          controller: controller,
          cursorColor: green,
          decoration: InputDecoration(
              //In this case a notify is displaying the error message.
              errorStyle: const TextStyle(fontSize: 0),
              suffixIcon: IconButton(
                onPressed: suffixAction,
                icon: Icon(suffixIcon),
                color: Colors.black,
              ),
              // hintStyle: RecipeText.small(),
              hintText: title,
              filled: true,
              fillColor: Colors.white,
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  borderSide: BorderSide(width: 1.5, color: red)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  borderSide: BorderSide(width: 1.5, color: red)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.r),
                  borderSide: BorderSide(
                      width: 1.5, color: readOnly == null ? green : grey)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: grey),
                  borderRadius: BorderRadius.circular(40.r))),
        ),
      ),
    );
  }
}
