import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/color_resources.dart';

class BuildTextFormFieldWidget extends StatefulWidget {
  const BuildTextFormFieldWidget({super.key,
    this.controller,
    this.suffixIcon,
    this.hintText = '',
    this.textInputType,
    this.validator,
    this.obscureText = false,
    this.height,
    this.radius = 12,
    this.hintFontSize = 14,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.counterText = "0",
    this.onChanged,
    this.showCounter = false,
    this.fillColor = ColorResources.whiteColor,
    this.hasBorder = true
  });

  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final TextInputType? textInputType;
  final bool? obscureText;
  final double? height;
  final double radius;
  final double hintFontSize;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final String counterText;
  final bool showCounter;
  final void Function(String)? onChanged;
  final Color fillColor;
  final bool hasBorder;

  @override
  State<BuildTextFormFieldWidget> createState() => _BuildTextFormFieldWidgetState();
}

class _BuildTextFormFieldWidgetState extends State<BuildTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        controller: widget.controller,
        cursorColor: ColorResources.blackColor,
        keyboardType: widget.textInputType,
        obscureText: widget.obscureText!,
        onChanged: widget.onChanged,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        style: TextStyle(color: ColorResources.blackColor, fontSize: 16.sp, fontFamily: "Poppins"),
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(right: 16.w,left: 16.w,top: 0,bottom: 0),
          counter: widget.showCounter ? TextWidget(
            "${widget.counterText} / ${widget.maxLength}"
          ) : null,
          hintText: widget.hintText,
          filled: true,
          fillColor: widget.fillColor ,
          hintStyle: TextStyle(color: ColorResources.borderColor, fontSize: widget.hintFontSize, fontFamily: "Inter", fontWeight: FontWeight.w400),
          suffixIcon: widget.suffixIcon,
          enabledBorder: widget.hasBorder ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: const BorderSide(color: ColorResources.borderColor,)
          ) : InputBorder.none,
          focusedBorder: widget.hasBorder ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: const BorderSide(color: ColorResources.borderColor,)
          ) : InputBorder.none,
        ),
        validator: widget.validator
      ),
    );
  }
}
