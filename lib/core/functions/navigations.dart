import 'package:flutter/material.dart';

// Usage: fly route

void pushPage(BuildContext context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void replacePage(BuildContext context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void pushPageAndRemoveAll(BuildContext context, page) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => page), (route) => false);
}

// ----------------------------------------------------------------

// Usage: Named route

void pushPageNamed(BuildContext context, page, [Object? arguments]) {
  Navigator.pushNamed(context, page, arguments: arguments);
}

void replacePageNamed(BuildContext context, page, [Object? arguments]) {
  Navigator.pushReplacementNamed(context, page, arguments: arguments);
}

void pushPageAndRemoveAllNamed(BuildContext context, page,
    [Object? arguments]) {
  Navigator.pushNamedAndRemoveUntil(context, page, (route) => false,
      arguments: arguments);
}
