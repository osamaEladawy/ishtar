import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishtar/common/widget/custom_text_field.dart';
import 'package:ishtar/config/resources.dart';
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
        SizedBox(width: 10.w),
        Container(
          height: 48.h,
          decoration: BoxDecoration(
            color: const Color(0xffF7F5F9),
            borderRadius: BorderRadius.circular(8.w),
            border: Border.all(
              color: const Color(0xffE2E2E2),
              width: 1.w,
            ),
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
                    SvgPicture.asset(IconsManger.arrowDownIcon),
                    SizedBox(width: 7.7.w),
                    Image.asset(
                      countryCode!.flagUri!,
                      package: 'country_code_picker',
                      width: 32.0.w,
                      height: 21.h,
                    ),
                    // Text('${countryCode}'),
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
      ],
    );
  }
}

List<Widget> groups = [];
