
import 'package:flutter/material.dart';


class TextWidget extends StatelessWidget {
  final String text;
  final List<String>? args;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  const TextWidget(this.text,
      {super.key, this.textStyle, this.textAlign, this.args, this.maxLines, this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
