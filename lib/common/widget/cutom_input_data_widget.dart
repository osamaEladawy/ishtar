import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/text_form_field.dart';
import 'package:ishtar/common/widget/text_widget.dart';

import '../../config/app_text_styles.dart';
import '../../config/color_resources.dart';

class CustomRowTextField extends StatelessWidget {
  CustomRowTextField({
    super.key,
    this.label,
    this.type,
    this.onChange,
    this.controller,
    this.errorLabel,
    this.isDisable = false,
    this.onTap,
    this.padding = 30,
    this.maxLines = 1,
    this.minLines = 1,
    this.isValidator = false,
    this.validateMessage ="",
    this.width = 80,
    this.contentWidth = false,
    this.isRow = true,
    this.prefix,
    this.hint,
    this.maxLength,
    this.counterText = "0",
    this.onChanged,
    this.showCounter = false
  });

  final String? label;
  final String? errorLabel;
  final TextEditingController? controller;
  final TextInputType? type;
  final Function(String)? onChange;
  final Function()? onTap;
  final bool isDisable;
  final double padding;
  final int maxLines;
  final int minLines;
  final bool isValidator;
  final String validateMessage;
  final double width;
  final bool contentWidth;
  final bool isRow;
  final Widget? prefix;
  final String? hint;
  final int? maxLength;
  final String counterText;
  final void Function(String)? onChanged;
  final bool showCounter;

  @override
  Widget build(BuildContext context) {
    return isRow ? buildRow(context) : buildColumn(context);
  }
////////////////////////////////////////////////////////////////////////////////
  buildRow(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(label != null)...[
            SizedBox(
              width: width,
              child: TextWidget(
                label!,
                textStyle: AppTextStyle.textStyle(appFontSize: 16.sp, appFontWeight: FontWeight.w600, color: ColorResources.blackColor,),
              ),
            ),
          ],
          Expanded(
            child: BuildTextFormFieldWidget(
              controller: controller,
              hintText: hint,
              minLines: minLines,
              maxLines: maxLines,
              maxLength: maxLength,
              counterText: counterText,
              onChanged: onChanged,
              showCounter: showCounter,
            ),
          ),
        ],
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////////
  buildColumn(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(label != null)...[
            TextWidget(
              label!,
              textStyle: AppTextStyle.textStyle(appFontSize: 16.sp, appFontWeight: FontWeight.w600, color: ColorResources.blackColor,),
            ),
            SizedBox(height: 10.h,),
          ],
          BuildTextFormFieldWidget(
            controller: controller,
            hintText: hint,
            minLines: minLines,
            maxLines: maxLines,
          ),
        ],
      ),
    );
  }
}