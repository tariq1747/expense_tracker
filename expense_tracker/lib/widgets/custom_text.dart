import 'package:Oppointments/res/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.lable, required this.child});

  final String lable;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$lable : ',
          style: TextStyle(fontSize: 16.sp),
        ),
        Flexible(child: child)
      ],
    );
  }
}

class Textf extends StatelessWidget {
  const Textf(
      {super.key,
      required this.controller,
      this.validator,
      this.textInputType,
      this.onchange,
      this.suffixIcon,
      this.prefixIcon,
      this.readOnly,
      this.onTap,
      this.onFieldSubmit,
      this.hintText,
      this.borderColor,
      this.fillColor,
      this.cursorColor,
      this.hintStyle,
      this.style,
      this.alignLabelWithHint,
      this.minLines,
      this.maxLines,
      this.maxLength,
      this.radius,
      this.textInputAction,
      this.contentPadding,
      this.focusNode,
      this.inputFormatters});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final Function(String value)? onchange;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? readOnly;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmit;
  final String? hintText;
  final Color? borderColor;
  final Color? fillColor;
  final Color? cursorColor;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final bool? alignLabelWithHint;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final double? radius;
  final TextInputAction? textInputAction;
  final EdgeInsets? contentPadding;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.transparency,
        child: TextFormField(
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          focusNode: focusNode,
          onFieldSubmitted: onFieldSubmit,
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          style: style,
          onTap: onTap,
          cursorColor: cursorColor,
          readOnly: readOnly ?? false,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            alignLabelWithHint: alignLabelWithHint,
            fillColor: fillColor ?? Colors.white,
            hintText: hintText,
            hintStyle: hintStyle,
            isDense: true,
            contentPadding: contentPadding,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? Dimens.twentyFive),
              borderSide: BorderSide(
                color: borderColor ?? Colors.black,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? Dimens.twentyFive),
              borderSide: BorderSide(
                color: borderColor ?? Colors.black,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? Dimens.twentyFive),
              borderSide: BorderSide(
                color: borderColor ?? Colors.black,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? Dimens.twentyFive),
              borderSide: BorderSide(
                color: borderColor ?? Colors.black,
                width: 1,
              ),
            ),
            counterText: '',
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          onChanged: onchange,
        ),
      );
}
