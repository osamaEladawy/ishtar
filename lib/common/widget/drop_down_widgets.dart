import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/text_widget.dart';

import '../../config/app_text_styles.dart';
import '../../config/color_resources.dart';

class CustomDropDownWidget extends StatefulWidget {
  const CustomDropDownWidget({
    super.key,
    this.hint,
    this.itemsList,
    this.onChanged,
    this.heightButton
  });

  final void Function(dynamic)? onChanged;
  final String? hint;
  final List<DropdownMenuItem<dynamic>>? itemsList;
  final double? heightButton;

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.heightButton,
      child: DropdownButtonFormField(
          isExpanded: true,
          // value: widget.value,
          onChanged: widget.onChanged,
          hint: widget.hint != null ? TextWidget(
            widget.hint!,
            textStyle: AppTextStyle.textStyle(appFontSize: 13.sp, appFontWeight: FontWeight.w400, color: ColorResources.borderColor,),
          ) : null,
          icon: const Icon(Icons.keyboard_arrow_down, color:ColorResources.dropDownIconColor, size: 18,),
          dropdownColor: ColorResources.whiteColor,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            constraints: const BoxConstraints(maxHeight: 50),
            filled: true,
            fillColor: ColorResources.whiteColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ColorResources.borderColor, width: .5.w)
            )
          ),
          items: widget.itemsList
      ),
    );
  }
}
