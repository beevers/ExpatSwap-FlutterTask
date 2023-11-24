import 'package:expatswap_fluttertask/view/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFormField extends ConsumerStatefulWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final Function()? onTap;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool hasBorder;
  final EdgeInsets? padding;
  final bool? readOnly;

  AppFormField({
    this.readOnly,
    super.key,
    this.onTap,
    this.hintText,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.keyboardType,
    this.controller,
    this.validator,
    this.hasBorder = true,
    this.padding,
  });
  final obscureTextProvider = StateProvider((ref) => true);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends ConsumerState<AppFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly != null ? true : false,
      onTap: widget.onTap,
      cursorColor: Colors.black,
      validator: widget.validator,
      controller: widget.controller,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      keyboardType: widget.keyboardType,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xff9C9C9C),
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderSide: widget.hasBorder
              ? BorderSide(color: grey, width: 1.2.w)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: widget.hasBorder
              ? BorderSide(color: grey, width: 1.2.w)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(10.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: red, width: 2.w),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: widget.hasBorder
              ? BorderSide(color: green, width: 2.w)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(10.r),
        ),
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        filled: true,
        contentPadding: widget.padding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      ),
    );
  }
}
