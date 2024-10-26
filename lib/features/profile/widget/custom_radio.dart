import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    super.key,
    required this.title,
    required this.valueChanged,
    this.value,
    this.groupValue,
  });
  final String title;
  final value;
  final groupValue;
  final ValueChanged<dynamic> valueChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          activeColor: Color(0xff188DFF),
          // hoverColor: Color(0xffB6B6B6),
          value: value,
          groupValue: groupValue,
          onChanged: (value) {
            valueChanged(value!);
          },
        ),
        TextWidget(
          title,
          textStyle: AppTextStyle.textStyle(
            roboto: true,
            appFontSize: 14.sp,
            appFontHeight: 16.94.sp,
            appFontWeight: FontWeight.w400,
            color: Color(0xff656565),
          ),
        ),
      ],
    );
  }
}
