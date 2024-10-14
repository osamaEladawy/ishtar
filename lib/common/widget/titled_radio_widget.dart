import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomRadio extends StatefulWidget {
  final String value;
  final String groupValue;
  final void Function(String) onChanged;
  const CustomRadio({Key? key, required this.value, required
  this.groupValue, required this.onChanged})
      : super(key: key);


  @override

  _CustomRadioState createState() => _CustomRadioState();

}


class _CustomRadioState extends State<CustomRadio> {

  @override

  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      onTap: () => widget.onChanged(widget.value),
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            border: Border.all(
              color: selected ? Colors.transparent:Color(0xff292D32)
            ),
            shape: BoxShape.circle, color: selected ? Theme.of(context).primaryColor : Colors.white ),
        child: selected ? Icon(
          Icons.check,
          size: 20.w,
          color: selected ? Colors.white : Colors.transparent,
        ) : SizedBox(
          width: 20.w,
          height: 20.h,
        ),
      ),
    );
  }
}
