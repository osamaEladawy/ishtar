import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/custom_text_field.dart';
import 'package:ishtar/config/color_resources.dart';
import 'package:ishtar/core/functions/snackbar.dart';

class CustomFieldPhoneNumber extends StatelessWidget {
  final ValueChanged<String> valueChanged;
  const CustomFieldPhoneNumber({
    super.key,
    required this.valueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 55.h,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(8.w),
            border: Border.all(color: ColorResources.borderColor, width: 1.5),
          ),
          child: Container(
            width: 100.w,
            height: 48.h,
            alignment: Alignment.center,
            child: CountryCodePicker(
              onChanged: print,
              builder: (countryCode) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      countryCode!.flagUri!,
                      package: 'country_code_picker',
                      width: 30.0.w,
                    ),
                    Text('${countryCode}'),
                    SizedBox(
                      width: 2.w,
                    ),
                    SvgPicture.asset(''), // Arrow-down icon
                  ],
                );
              },
              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
              initialSelection: '+20',
              favorite: ['+20', '+966'],
              // optional. Shows only country name and flag
              showCountryOnly: true,
              // optional. Shows only country name and flag when popup is closed.
              showOnlyCountryWhenClosed: false,
              // optional. aligns the flag and the Text left
              alignLeft: false,
              countryFilter: ['+20', '+966'],
              hideSearch: false,
              textStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xff414141),
                  fontWeight: FontWeight.w500),
              dialogSize: const Size(50, 300),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: CustomTextField(
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              try {
                valueChanged(value);
              } catch (e) {
                showSnackBar(context, 'Invalid phone number');
              }
            },
            //controller: _phoneController,
            // hintText: LocaleKeys.enterYourPhoneNumber.tr(),
          ),
        ),
      ],
    );
  }
}
